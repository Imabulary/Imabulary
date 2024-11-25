# terraform-state-bucket.tf

This Terraform configuration creates a secure Google Cloud Storage (GCS) bucket for managing Terraform remote state and generates a local file (`backend.tf`) to configure the backend. The advantage of using this is that it allows multiple people to work simultaneously on infrastructure as well as ensure consistency.

## Resources

- **Google Cloud Storage Bucket**:
  - Stores the Terraform remote state.
  - Enforces security best practices:
    - Public access prevention: **Enforced**
    - Uniform bucket-level access: **Enabled**
    - Object versioning: **Enabled**
    - `force_destroy`: **False** (prevents accidental deletion of objects).
  - Region: **US**

- **Local File**:
  - Creates a `backend.tf` file in the module directory.
  - Configures Terraform to use the GCS bucket as the remote backend.

# backend.tf
This contains the reference to the created bucket which stores the state file. It tells Terraform to fetch state from the specified bucket.

# network.tf

This Terraform configuration sets up a Virtual Private Cloud (VPC) network and its subnets using the `terraform-google-modules/network/google` module.

## Overview

The configuration defines:
- A VPC named `imabulary-development-vpc`.
- One subnet:
  1. **`vm-subnet`**: Hosts virtual machines.
- Ingress rules for SSH access and public API access.

## Configuration Details

- **Module**: `terraform-google-modules/network/google`
- **Version**: `~> 9.3`
- **Project ID**: Set dynamically using the `var.project-id` variable.
- **Region**: The subnet is deployed in `us-central1`.
- **Ingress Rules**:
  - **SSH Ingress IAP**: Allows SSH access from Google Cloud Console IAP range (`35.235.240.0/20`) to port `22`.
  - **API Ingress Public**: Allows public access to API on port `5000` from all IPs (`0.0.0.0/0`).

## Subnet Specifications

| Subnet Name | IP Range      | Region       | Description                          |
|-------------|---------------|--------------|--------------------------------------|
| `vm-subnet` | `10.0.1.0/24` | `us-central1`| Used to host the virtual machines.   |

# vm.tf

This Terraform configuration provisions a Google Cloud virtual machine (VM) with the following features:
- A dedicated service account for pulling images from Google Artifact Registry.
- Docker is automatically installed on startup using a metadata startup script.
- Integration with a custom VPC network and subnetwork.
- Uses a balanced machine type and runs Ubuntu 22.04 LTS.

### Service Account for the VM
- **Resource**: `google_service_account.artifact_registry_sa`
  - **Account ID**: `vm-artifact-registry-pull-sa`
  - **Display Name**: Service Account for pulling Images from Google Artifact Registry

### IAM Binding for Artifact Registry
Grants the service account pull permissions for Google Artifact Registry.

- **Resource**: `google_artifact_registry_repository_iam_member.artifact_registry_pull`
  - **Project**: Set using `var.project-id`
  - **Location**: `us-central1`
  - **Repository**: `google_artifact_registry_repository.imabulary-dev-repo.name`
  - **Role**: `roles/artifactregistry.reader`
  - **Member**: `serviceAccount:${google_service_account.artifact_registry_sa.email}`
  - **Dependency**: `google_artifact_registry_repository.imabulary-dev-repo`

### External IP
- **Resource**: `google_compute_address.vm-ip`
  - **Name**: `vm-reserved-ext-ip`
  - **Region**: `us-central1`

### VM Instance
Provisions a virtual machine in the `us-central1-c` zone with the following features:
- **Name**: `docker-vm`
- **Machine Type**: `e2-standard-2`
- **Zone**: `us-central1-c`
- **Network Interface**:
  - **Network**: `module.vpc.network_name`
  - **Subnetwork**: `module.vpc.subnets["us-central1/vm-subnet"].id`
  - **Access Config**:
    - **NAT IP**: `google_compute_address.vm-ip.address`

- **Boot Disk**:
  - **Image**: `ubuntu-2204-jammy-v20241119`

- **Service Account for VM**:
  - **Email**: `google_service_account.artifact_registry_sa.email`
  - **Scopes**: `https://www.googleapis.com/auth/cloud-platform`

- **Startup Script**:
  Installs Docker and PostgreSQL client, ensuring the VM is ready for containerized workflows and database interactions.
  ```
  sudo apt update
  sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" -y
  sudo apt update
  sudo apt install -y docker-ce docker-ce-cli containerd.io
  sudo usermod -aG docker $USER
  sudo apt install -y postgresql-common
  sudo install -d /usr/share/postgresql-common/pgdg
  sudo curl -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc
  sudo sh -c 'echo "deb [signed-by=/usr/share/postgresql-common/pgdg/apt.postgresql.org.asc] https://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
  sudo apt update
  sudo apt install postgresql-client-15 -y
  ```

- **Dependencies**:
  - **Artifact Registry Pull Permissions**: `google_artifact_registry_repository_iam_member.artifact_registry_pull`

### Secret Access IAM Member
Grants the service account access to read secrets from Secret Manager.

- **Resource**: `google_project_iam_member.secret-vm-access`
  - **Project**: Set using `var.project-id`
  - **Role**: `roles/secretmanager.secretAccessor`
  - **Member**: `serviceAccount:${google_service_account.artifact_registry_sa.email}`

# github-iam.tf

This Terraform configuration sets up Identity and Access Management (IAM) for GitHub Actions to interact with Google Cloud resources.

## Resources

### Google Service Account
Creates a service account to allow GitHub Actions to authenticate and push container images to Google Artifact Registry.

- **Resource**: `google_service_account.gha_service_account`
  - **Account ID**: `github-oidc-push-image-gcr`
  - **Display Name**: `Github OIDC Service Account`
  - **Description**: Used by GitHub Actions (GHA) to push images to Artifact Registry
  - **Create Ignore Already Exists**: Set to `true` to avoid errors if the service account already exists.

### IAM Binding for Artifact Registry
Grants the GitHub Actions service account push permissions (`roles/artifactregistry.createOnPushWriter`) on a specific Google Artifact Registry repository.

- **Resource**: `google_project_iam_member.gcr-push-policy`
  - **Project**: Set using `var.project-id`
  - **Role**: `roles/artifactregistry.createOnPushWriter`
  - **Member**: `serviceAccount:${google_service_account.gha_service_account.email}`
  - **Dependency**: `google_service_account.gha_service_account`

### Workload Identity Pool
Creates a workload identity pool for GitHub Actions authentication.

- **Resource**: `google_iam_workload_identity_pool.dev-pool`
  - **Workload Identity Pool ID**: `imabulary-dev-pool`
  - **Display Name**: `imabulary-dev-pool`
  - **Description**: Identity pool for Imabulary Dev GHA
  - **Disabled**: Set to `false`

### Workload Identity Pool Provider
Creates a workload identity pool provider for GitHub Actions.

- **Resource**: `google_iam_workload_identity_pool_provider.gha-dev-oidc`
  - **Workload Identity Pool ID**: `google_iam_workload_identity_pool.dev-pool.workload_identity_pool_id`
  - **Provider ID**: `github-dev-oidc-provider`
  - **Display Name**: `Dev Github Actions OIDC`
  - **Description**: GitHub Actions identity pool provider for automated build and push
  - **Disabled**: Set to `false`
  - **Attribute Condition**: Matches specific conditions such as repository owner ID and repository name (`assertion.repository_owner_id == "170342349" && attribute.repository == "Imabulary/Imabulary" && assertion.repository_owner == 'Imabulary'`)
  - **Attribute Mapping**: Maps various attributes from the OIDC assertion
  - **Issuer URI**: `https://token.actions.githubusercontent.com`

### IAM Binding for Workload Identity User
Grants permissions to impersonate the service account via the workload identity pool.

- **Resource**: `google_project_iam_binding.sa-impersonate`
  - **Project**: Set using `var.project-id`
  - **Role**: `roles/iam.workloadIdentityUser`
  - **Members**: Principal set URL for workload identity pool (`principalSet://iam.googleapis.com/projects/461121489085/locations/global/workloadIdentityPools/imabulary-dev-pool/attribute.repository/Imabulary/Imabulary`)

### Secret Access IAM Member
Grants the GitHub Actions service account access to read secrets from Secret Manager.

- **Resource**: `google_project_iam_member.secret-access`
  - **Project**: Set using `var.project-id`
  - **Role**: `roles/secretmanager.secretAccessor`
  - **Member**: `serviceAccount:${google_service_account.gha_service_account.email}`

### SSH Access IAM Member
Grants SSH tunnel access to the GitHub Actions service account for connecting to Compute Engine instances.

- **Resource**: `google_project_iam_member.ssh-access`
  - **Project**: Set using `var.project-id`
  - **Role**: `roles/iap.tunnelResourceAccessor`
  - **Member**: `serviceAccount:${google_service_account.gha_service_account.email}`

### Compute Instance Admin IAM Member
Grants Compute Engine instance administrative privileges to the GitHub Actions service account.

- **Resource**: `google_project_iam_member.gh-ssh-access`
  - **Project**: Set using `var.project-id`
  - **Role**: `roles/compute.instanceAdmin.v1`
  - **Member**: `serviceAccount:${google_service_account.gha_service_account.email}`

### Service Account User IAM Member
Grants permissions for the GitHub Actions service account to act as a service account user.

- **Resource**: `google_project_iam_member.gh-svc-ssh-access`
  - **Project**: Set using `var.project-id`
  - **Role**: `roles/iam.serviceAccountUser`
  - **Member**: `serviceAccount:${google_service_account.gha_service_account.email}`

# registry.tf

This Terraform configuration creates a Google Artifact Registry repository for storing Docker images for the `imabulary` project.

### Google Artifact Registry Repository

- **Resource**: `google_artifact_registry_repository.imabulary-dev-repo`
  - **Repository ID**: `imabulary-dev`
  - **Location**: `us-central1`
  - **Description**: Repository for storing development images for the Imabulary project
  - **Format**: `DOCKER`
  - **Cleanup Policy Dry Run**: Set to `false`

- **Cleanup Policies**:
  1. **Keep Latest 5 Versions**:
     - **ID**: `keep-latest-5-versions`
     - **Action**: `KEEP`
     - **Most Recent Versions**: Keeps the last 5 versions of images.
  2. **Delete Old Versions**:
     - **ID**: `delete-old-versions`
     - **Action**: `DELETE`
     - **Condition**:
       - **Tag State**: `ANY`
       - **Older Than**: `0s` (Ensures any version older than the latest 5 is deleted).

# sql.tf

This Terraform configuration provisions a Google Cloud SQL database instance and configures the related networking and access.

### Secret Manager Integration

- **Postgres Password**: The PostgreSQL password is securely retrieved from Google Secret Manager.
  - **Secret Name**: `postgres-details-password`
- **Database Name**: The name of the database is also stored in Google Secret Manager.
  - **Secret Name**: `postgres-details-db-name`

### Database Instance

- **Resource**: `google_sql_database_instance.dev-db`
  - **Name**: `imabulary-dev-priv-db`
  - **Region**: `us-central1`
  - **Database Version**: `POSTGRES_15`
  - **Settings**:
    - **Availability Type**: `ZONAL`
    - **Tier**: `db-custom-2-8192`
    - **Edition**: `ENTERPRISE`
    - **IP Configuration**:
      - **IPv4 Enabled**: `false`
      - **Private Network**: Connects to the custom VPC (`module.vpc.network_self_link`)
      - **SSL Mode**: `ENCRYPTED_ONLY`
    - **Backup Configuration**:
      - **Enabled**: `true`
      - **Location**: `us-central1`
      - **Point in Time Recovery Enabled**: `false`
      - **Backup Retention Settings**:
        - **Retained Backups**: `3`
  - **Deletion Protection**: Set to `false` to allow safe deletion in a controlled manner.
  - **Lifecycle Settings**:
    - **Ignore Changes**:
      - **Disk Size** (`settings[0].disk_size`)
      - **Disk Autoresize** (`settings[0].disk_autoresize`)

### Private IP Configuration

- **Resource**: `google_compute_global_address.private_ip_address`
  - **Provider**: `google-beta`
  - **Name**: `db-priv-ip`
  - **Purpose**: `VPC_PEERING`
  - **Address Type**: `INTERNAL`
  - **Network**: `module.vpc.network_id`
  - **Prefix Length**: `24`

- **Service Networking Connection**:
  - **Resource**: `google_service_networking_connection.db-priv-conn`
    - **Provider**: `google-beta`
    - **Network**: `module.vpc.network_id`
    - **Service**: `servicenetworking.googleapis.com`
    - **Reserved Peering Ranges**: `[google_compute_global_address.private_ip_address.name]`

### SQL User

- **Resource**: `google_sql_user.users`
  - **Name**: `svc_app`
  - **Instance**: `google_sql_database_instance.dev-db.name`
  - **Password**: Retrieved from Google Secret Manager (`data.google_secret_manager_secret_version.postgres_password.secret_data`)

### SQL Database

- **Resource**: `google_sql_database.dev-db`
  - **Name**: Retrieved from Google Secret Manager (`data.google_secret_manager_secret_version.db-name.secret_data`)
  - **Instance**: `google_sql_database_instance.dev-db.name`

# sql.tf

This Terraform configuration provisions a Google Cloud SQL database instance and configures the related networking and access.

### Secret Manager Integration

- **Postgres Password**: The PostgreSQL password is securely retrieved from Google Secret Manager.
  - **Secret Name**: `postgres-details-password`
- **Database Name**: The name of the database is also stored in Google Secret Manager.
  - **Secret Name**: `postgres-details-db-name`

### Database Instance

- **Resource**: `google_sql_database_instance.dev-db`
  - **Name**: `imabulary-dev-priv-db`
  - **Region**: `us-central1`
  - **Database Version**: `POSTGRES_15`
  - **Settings**:
    - **Availability Type**: `ZONAL`
    - **Tier**: `db-custom-2-8192`
    - **Edition**: `ENTERPRISE`
    - **IP Configuration**:
      - **IPv4 Enabled**: `false`
      - **Private Network**: Connects to the custom VPC (`module.vpc.network_self_link`)
      - **SSL Mode**: `ENCRYPTED_ONLY`
    - **Backup Configuration**:
      - **Enabled**: `true`
      - **Location**: `us-central1`
      - **Point in Time Recovery Enabled**: `false`
      - **Backup Retention Settings**:
        - **Retained Backups**: `3`
  - **Deletion Protection**: Set to `false` to allow safe deletion in a controlled manner.
  - **Lifecycle Settings**:
    - **Ignore Changes**:
      - **Disk Size** (`settings[0].disk_size`)
      - **Disk Autoresize** (`settings[0].disk_autoresize`)

### Private IP Configuration

- **Resource**: `google_compute_global_address.private_ip_address`
  - **Provider**: `google-beta`
  - **Name**: `db-priv-ip`
  - **Purpose**: `VPC_PEERING`
  - **Address Type**: `INTERNAL`
  - **Network**: `module.vpc.network_id`
  - **Prefix Length**: `24`

- **Service Networking Connection**:
  - **Resource**: `google_service_networking_connection.db-priv-conn`
    - **Provider**: `google-beta`
    - **Network**: `module.vpc.network_id`
    - **Service**: `servicenetworking.googleapis.com`
    - **Reserved Peering Ranges**: `[google_compute_global_address.private_ip_address.name]`

### SQL User

- **Resource**: `google_sql_user.users`
  - **Name**: `svc_app`
  - **Instance**: `google_sql_database_instance.dev-db.name`
  - **Password**: Retrieved from Google Secret Manager (`data.google_secret_manager_secret_version.postgres_password.secret_data`)

### SQL Database

- **Resource**: `google_sql_database.dev-db`
  - **Name**: Retrieved from Google Secret Manager (`data.google_secret_manager_secret_version.db-name.secret_data`)
  - **Instance**: `google_sql_database_instance.dev-db.name`


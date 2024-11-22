# terraform-state-bucket.tf

This Terraform configuration creates a secure Google Cloud Storage (GCS) bucket for managing Terraform remote state and generates a local file (`backend.tf`) to configure the backend. The advantage of using this is that it allows multiple people to work simultaneously on infrastructure as well as ensure consistency

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
This contains the reference to the created bucket which stores the state file. It tells Terraform to fetch state from the specified bucket

# network.tf

This Terraform configuration sets up a Virtual Private Cloud (VPC) network and its subnets using the `terraform-google-modules/network/google` module.

## Overview

The configuration defines:
- A VPC named `imabulary-development-vpc`.
- Two subnets:
  1. **`vm-subnet`**: Hosts virtual machines.
  2. **`sql-subnet`**: Hosts SQL instances.

## Configuration Details

- **Module**: `terraform-google-modules/network/google`
- **Version**: `~> 9.3`
- **Project ID**: Set dynamically using the `var.project-id` variable.
- **Region**: Both subnets are deployed in `us-central1`.

## Subnet Specifications

| Subnet Name | IP Range      | Region       | Description                          |
|-------------|---------------|--------------|--------------------------------------|
| `vm-subnet` | `10.0.1.0/24` | `us-central1`| Used to host the virtual machines.   |
| `sql-subnet`| `10.0.2.0/24` | `us-central1`| Used to host the SQL instance.       |


# vm.tf

This Terraform configuration provisions a Google Cloud virtual machine (VM) with the following features:
- A dedicated service account for pulling images from Google Artifact Registry.
- Docker is automatically installed on startup using a metadata startup script.
- Integration with a custom VPC network and subnetwork.
- Uses a balanced machine type and runs Ubuntu 22.04 LTS.

---

## Resources

### Google Service Account
Creates a service account to allow the VM to authenticate and pull container images from Google Artifact Registry.

- **Purpose**: Provides the VM with secure credentials.
- **Key Attributes**:
  - `account_id`: A unique identifier for the service account.
  - `display_name`: A human-readable description of the service account.

---

### IAM Binding for Artifact Registry
Grants the service account pull permissions (`roles/artifactregistry.reader`) on a specific Google Artifact Registry repository.

- **Purpose**: Ensures the service account has the required access to pull container images securely.
- **Key Attributes**:
  - **Role**: `roles/artifactregistry.reader` allows reading from the Artifact Registry.
  - **Member**: Links the service account to the specified repository.
  - **Dependency Management**: Ensures the repository is created before the IAM binding is applied.

---

### VM Instance
Provisions a virtual machine in the `us-central1-c` zone with the following features:
- **Machine Type**: `e2-standard-2` for optimal cost-performance balance.
- **Boot Disk**: Uses Ubuntu 22.04 LTS for a stable and secure operating system.
- **Startup Script**: Installs Docker automatically during initialization, ensuring the VM is ready for containerized workflows.
- **Networking**:
  - Connects to a custom VPC and subnetwork (`vm-subnet`) for controlled access.
  - Configures a service account for secure API access.

---
## Summary
The `vm.tf` configuration is designed to automate the deployment of a Docker-ready virtual machine in Google Cloud:
- Ensures secure access to Artifact Registry via a dedicated service account.
- Uses a metadata startup script to install and configure Docker.
- Connects seamlessly to a custom VPC and subnetwork.
# Setup Instructions

### Step 1: Install Terraform
- Follow the official Terraform installation guide to set up Terraform on your local machine: [Terraform Installation Guide](https://learn.hashicorp.com/tutorials/terraform/install-cli).

### Step 2: Install Google Cloud SDK (gcloud)
- Follow the instructions to install Google Cloud SDK on your system: [Install Google Cloud SDK](https://cloud.google.com/sdk/docs/install).

### Step 3: Clone the Repository
- Clone the `Imabulary` infrastructure repository:
  ```sh
  git clone https://github.com/Imabulary/Imabulary.git
  ```

### Step 4: Authenticate Using gcloud
- Run the following command to authenticate your local environment:
  ```sh
  gcloud auth application-default login
  ```

### Step 5: Change Directory to the Development Folder
- Navigate to the development infrastructure directory:
  ```sh
  cd Imabulary/infrastructure-gcp/development/
  ```

### Step 6: Apply Terraform Configuration
- Run Terraform to apply the infrastructure changes:
  ```sh
  terraform apply -lock=false
  ```

### Step 7: Copy Deployment Script to VM (Recommended: Use In-Browser SSH)
- Use the in-browser SSH feature from Google Cloud Console to access your VM and copy the `deploy.sh` script to the desired path on the VM.

### Step 8: Update GitHub Actions
- Modify the GitHub Actions workflow to set up the SSH key and run the deployment script using the following command:
  ```yaml
  - name: Set up SSH key
    run: |
      gcloud compute ssh docker-vm \
      --zone=us-central1-c \
      --tunnel-through-iap \
      --command="sudo bash /desired/path/deploy.sh"
  ```

### Step 9: Checkout and Push Changes to the Develop Branch
- Checkout to the `develop` branch and push your changes:
  ```sh
  git checkout develop
  git add .
  git commit -m "Updated deployment configuration"
  git push origin develop
  ```
- Push your changes to the `develop` branch:
  ```sh
  git add .
  git commit -m "Updated deployment configuration"
  git push origin develop
  ```


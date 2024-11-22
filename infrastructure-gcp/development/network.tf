module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 9.3"
    project_id = var.project-id
    network_name = "imabulary-development-vpc"
    subnets = [
        {
            subnet_name = "vm-subnet"
            subnet_ip =   "10.0.1.0/24"
            subnet_region = "us-central1"
            description = "Used to host the virtual machine"
        },
        {
            subnet_name = "sql-subnet"
            subnet_ip =   "10.0.2.0/24"
            subnet_region = "us-central1"
            description = "Used to host the SQL instance"
        }

    ]
}
module "vpc" {
    source  = "terraform-google-modules/network/google"
    version = "~> 9.3"
    project_id = var.project-id
    network_name = "imabulary-prod-vpc"
    subnets = [
        {
            subnet_name = "prod-vm-subnet"
            subnet_ip =   "10.1.0.0/24"
            subnet_region = "us-central1"
            description = "Used to host the virtual machine"
        }

    ]
    ingress_rules = [
        {
            name = "prod-ssh-ingress-iap"
            description = "Allow SSH from Console"
            disabled = false
            source_ranges = ["35.235.240.0/20"]

            allow = [
                {
                    protocol = "tcp"
                    ports = ["22"]
                }
             ]
        },
         {
            name = "prod-api-ingress-public"
            description = "Allow API to be hit on port 5000"
            disabled = false
            source_ranges = ["0.0.0.0/0"]

            allow = [
                {
                    protocol = "tcp"
                    ports = ["5000"]
                }
             ]
        }
    ]
}
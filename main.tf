##  This is for reference

module "create_ec2" {
  source = "github.com/jaintpharsha/terraform_remote_modules//create_ec2"
  ## source = "github.com/jaintpharsha/terraform_remote_modules?ref=<commit_id>
  
  instance_type = "t2.micro"
  key_name = "terra_key"
  key_path = "./keys/terra_key.pem"
  sg_name = "terra_sg"
}

module "remote-exec" {
  source = "github.com/jaintpharsha/terraform_remote_modules//remote_exec"
  user_name = "ubuntu"
  ec2_public_ip = module.create_ec2.ec2_public_ip
  ec2_pem_path = "./keys/terra_key.pem"
}

### Examples

# select a specific tag
module "vpc" {
  source = "git::https://example.com/vpc.git?ref=v1.2.0"
}

# directly select a commit using its SHA-1 hash
module "storage" {
  source = "git::https://example.com/storage.git?ref=51d462976d84fdea54b47d80dcabbf680badcdb8"
}

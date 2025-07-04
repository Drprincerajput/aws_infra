module "vpc" {
  source              = "./modules/vpc"
  name                = "demo"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
}

module "ec2" {
  source         = "./modules/ec2"
  name           = "demo"
  instance_count = 2
  ami_id         = "ami-05ffe3c48a9991133" # Amazon Linux 2 (us-east-1)
  instance_type  = "t2.micro"
  subnet_ids     = module.vpc.public_subnets
  vpc_id         = module.vpc.vpc_id
  key_name       = "prince-key"
}

module "alb" {
  source       = "./modules/alb"
  name         = "demo"
  subnet_ids   = module.vpc.public_subnets
  vpc_id       = module.vpc.vpc_id
  instance_ids = module.ec2.instance_ids
}

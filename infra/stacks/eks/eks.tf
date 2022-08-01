# Borrowed from https://github.com/terraform-aws-modules/terraform-aws-eks/tree/master/examples/eks_managed_node_group

locals {
  name            = "toolbox-${replace(basename(path.cwd), "_", "-")}"
  cluster_version = "1.22"
  region          = "us-east-2"

  tags = {
    Example    = local.name
    GithubRepo = "toolbox"
    GithubOrg  = "ssmiller25"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name    = "diskbench-aws"
  cluster_version = "1.22"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets
  eks_managed_node_groups = {
    mainpool = {
      min_size     = 1
      max_size     = 3
      desired_size = 3
      instance_types = ["t3.small"]
      capacity_type  = "SPOT"
    }
  }
}


module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name = local.name
  cidr = "10.0.0.0/16"

  azs             = ["${local.region}a", "${local.region}b", "${local.region}c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

  enable_ipv6                     = true
  assign_ipv6_address_on_creation = true
  create_egress_only_igw          = true

  public_subnet_ipv6_prefixes  = [0, 1, 2]
  private_subnet_ipv6_prefixes = [3, 4, 5]

  enable_nat_gateway   = false
  single_nat_gateway   = false
  enable_dns_hostnames = true

  enable_flow_log                      = false
  create_flow_log_cloudwatch_iam_role  = false
  create_flow_log_cloudwatch_log_group = false

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.name}" = "shared"
    "kubernetes.io/role/elb"              = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.name}" = "shared"
    "kubernetes.io/role/internal-elb"     = 1
  }

  tags = local.tags
}

/*
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name    = "diskbench-aws"
  cluster_version = "1.22"

  eks_managed_node_groups = {
    mainpool = {
      min_size     = 1
      max_size     = 3
      desired_size = 3
      # with 2vCPU/8GB of ram...figure RAM probably more important to control then CPU
      instance_types = ["t3.large"]
      capacity_type  = "SPOT"
    }
  }
}
*/
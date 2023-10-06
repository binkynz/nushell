alias nv = nvim . # neovide .
alias lg = lazygit

alias kdev = kubectl --context=dev
alias kedev = kubectl --context=eks.dev
alias kus = kubectl --context=prod-us
alias keus = kubectl --context=eks.prod-us
alias keu = kubectl --context=prod-eu
alias keeu = kubectl --context=eks.prod-eu
alias ktools = kubectl --context=tools

alias dcu = docker compose up -d
alias dcd = docker compose down
alias dvc = docker volume prune -a -f

# def ti [tenv: string] {
#   let envs = { 
#     "dev": "dev", 
#     "prod-us": "prod-us", 
#     "prod-eu": "prod-eu" 
#   }
#
#   let profiles = {
#     "dev": "movio-dev",
#     "prod-us": "movio-prod-us",
#     "prod-eu": "movio-prod-eu"
#   }
#
#   let aws_regions = {
#     "dev": "ap-southeast-2",
#     "prod-eu": "eu-central-1",
#     "prod-us": "us-east-1",
#     "tools": "ap-southeast-2",
#     "eks-dev": "ap-southeast-2",
#     "eks-prod-eu": "eu-central-1",
#     "eks-prod-us": "us-east-1",
#   }
#
#   with-env [AWS_PROFILE ($profiles | get $tenv)] { $env.AWS_PROFILE }
#
#   terraform init 
#   -backend-config=$"bucket=movio-terraform-state-($envs | get $tenv)"
#   -backend-config=$"key=blue/blue-tng/envs/($envs | get $tenv).tfstate"
#   -backend-config=$"region=($aws_regions | get $tenv)"
#   -var-file $"envs/($envs | get $tenv).tfvars" 
#   -var-file $"envs/($envs | get $tenv)-secrets.tfvars" 
#   -var-file $"../tenants/($envs | get $tenv)-secrets.tfvars" 
#   -var-file "../deploy.tfvars" 
#   -var="k8s_config_file=~/.movio/kubeconfig/kdev.json"
# }

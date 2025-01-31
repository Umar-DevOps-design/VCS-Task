# providers.tf
provider "aws" {
  region = "us-east-1"  # First region
}

provider "aws" {
  alias  = "us-west-2"
  region = "us-west-2"  # Second region
}

provider "aws" {
  shared_config_files      = ["~/.aws/credentials"]
  shared_credentials_files = ["~/.aws/config"]
  profile = ["default"]
}

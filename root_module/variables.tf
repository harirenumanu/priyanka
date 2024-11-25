variable "rep_name" {
  default = "nginx_repo"
  type = string
}
variable "mutability" {
  default = "MUTABLE"
  type = string
}

variable "scan" {
  default = true
  type = bool
}
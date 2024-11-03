variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = []
}

variable "name_vpc" {}
variable "name_igw" {}

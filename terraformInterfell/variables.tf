# VPC

variable "create_vpc" {default = true}
variable "name" {default = "interfell"}
variable "cidr" {default = "10.0.0.0/24"}
variable "instance_tenancy" {default = "default"}
variable "enable_dns_hostnames" {default = true}
variable "enable_dns_support" {default = true}
variable "tags" {default = true}

variable "name_vpc" {default = "vpc-interfell"}

# IGW
variable "create_igw" {default = true}
variable "name_igw" {default = "igw-interfell"}





### subnet private_subnet_cidrs1


variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"
 default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "azs" {
 type        = list(string)
 description = "Availability Zones"
 default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

### subet public_subnet_cidrs ###

variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}


### subet intranet_subnet_cidrs ###

variable "intranet_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["10.0.7.0/24", "10.0.8.0/24", "10.0.9.0/24"]
}


variable "name_sg" {
  default = "sg_allow_ports"
}

variable "name_lb" {
  default = "lb-interfell"
}

variable "ingress_rules" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_block  = string
      description = string
    }))
    default     = [
        {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          description = "ssh"
        },
        {
          from_port   = 80
          to_port     = 80
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          description = "http"
        },
       {
          from_port   = 443
          to_port     = 443
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          description = "https"
        },
    ]
}


variable "egress_rules" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_block  = string
      description = string
    }))
    default     = [
        {
          from_port   = 0
          to_port     = 0
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          description = "internet"
        },

    ]
}


# EC2 
variable "ami" {default = "ami-08d4ac5b634553e16"}


variable "user_data_filepath" {
  description = "user_data_filepath"
  type        = string
  default     = "install.sh"
}



#### LB ####

variable "lb_target_tags_map" {
  description = "Tag map for the LB target resources"
  type        = map(string)
  default     =  {

    name    = "remedy"
      value  = "sg-remedy"
  } 
}



### Autoescaling

variable "image_id" {default = "ami-08d4ac5b634553e16"}
variable "instance_type" {default = "t2.micro"}
variable "key_name" {default = "mykey"}



# Auto Scaling
variable "max_size" {default = 4}
variable "min_size" {default = 4}
variable "desired_capacity" {default = 4}
variable "asg_health_check_type" {default = "ELB"}
variable "target_group_arns" {default = []}

###### RDS




variable "ingress_rules_rds" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_block  = string
      description = string
    }))
    default     = [
        {
          from_port   = 3306
          to_port     = 3306
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          description = "mysql"
        },

    ]
}

variable "name_sg_rds" {
  default = "sg_allow_ports_rds"
}

variable "private_group_name" {
 default = "10.0.4.0/24"
}
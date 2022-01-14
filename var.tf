
variable "clienet" {
  type = string
  #    default = "MyApp"
}

variable "av_zone-1" {
  type = string
  #   default = "us-east-1a"
  #    default = "eu-west-2a"
}

variable "av_zone-2" {
  type = string
}

variable "av_zone-3" {
  type = string
}

variable "env" {
  type = string
  #    default = "DEV"
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "region" {
  type = string
  #    default = "eu-west-2"
}

variable "Region_tag" {
  type = string
}

variable "vpc_cidr" {
  type = string
  #    default = "100.0.0.0/16"
}
variable "pub_subnet_01" {
  type = string
  #    default = "100.0.1.0/24"
}


variable "pub_subnet_02" {
  type = string
  #    default = "100.0.1.0/24"
}

variable "pub_subnet_03" {
  type = string
  #    default = "100.0.1.0/24"
}

variable "pvt_subnet_01" {
  type = string
  #    default = "100.0.2.0/24"
}
variable "pvt_subnet_02" {
  type = string
  #    default = "100.0.2.0/24"
}

variable "ami_id" {
  type = string
  #    default = ""
}

variable "ec2_instance_type" {
  type = string
  #    default = ""
}

variable "keyname" {
  type = string
  #    default = ""
}

#variable "ebs_block_device" {
#  type = string
#  #    default = ""
#}

variable "ec2_name_1" {
  type = string
  #    default = ""
}

variable "http" {
  type = number
}

variable "http_secure" {
  type = number
}

variable "ssh_port" {
  type = number
}


variable "rdp_port" {
  type = number
}


variable "web_var" {
  type = string
}

variable "web_port" {
  type = map(any)

  default = {
    web1 = "80"
    web2 = 8080
    web3 = "8081"
    web4 = "8082"
    web5 = "8083"
    web6 = "8084"
    web7 = "8085"
    web8 = "8086"
    SSL  = "443"
  }
}

#variable "encrypted" {
#  default = "true"
#}


#variable "kms_key_id" {
#  default = "59079620-2b47-xxxxxxxx-708ba394e195"
#}


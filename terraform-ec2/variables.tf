
# this file is responsible for variable config


variable "ec2_default_root_storage_size" {
	default = 10
	type = number
}

variable "ec2_ami_id" {
	default = "ami-019715e0d74f695be"
	type = string
}

variable "env" {
	default = "prd"
	type = string	

}


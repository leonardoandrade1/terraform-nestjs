variable "vpc_id" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "internet_gateway_id" {
  type = string
}

variable "available_azs" {
  type = object({
    names = list(string)
  })
}
variable "vpc" {
  # type = string
}

variable "public_subnets" {
  type = list(object({
    id = string
  }))
}

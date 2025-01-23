variable "public_subnets" {
  type = list(object({
    id = string
  }))
}

variable "launch_template" {

}

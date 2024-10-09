variable "zone-a" {
  type    = string
  default = "ru-central1-a"
}
variable "zone-b" {
  type    = string
  default = "ru-central1-b"
}
variable "network-1" {
  type    = string
  default = "network-1"
}
variable "subnet_v4-1" {
  type    = list(string)
  default = ["192.168.1.0/24"]
}
variable "subnet_v4-2" {
  type    = list(string)
  default = ["192.168.2.0/24"]
}
variable "subnet_v4-3" {
  type    = list(string)
  default = ["192.168.3.0/24"]
}
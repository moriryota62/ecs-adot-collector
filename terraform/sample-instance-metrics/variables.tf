# common parameter
variable "base_name" {
  description = "作成するリソースに付与する接頭語"
  type        = string
}

# module parameter
variable "private_subnet_ids" {
  description = "プライベートサブネットのID"
  type        = list(string)
}

variable "service_name" {
  description = "サービス名"
  type        = string
}

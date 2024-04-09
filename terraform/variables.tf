####################################################
# IAM
####################################################
variable "prod_user_name" {
  description = "prod user name"
}
####################################################
# Route 53
####################################################
# front
variable "a_alias_name" {
  description = "Route 53 a alias name"
}
variable "a_alias_zone_id" {
  description = "Route 53 a alias zone id"
}
variable "soa_record" {
  description = "Route 53 soa record"
}
variable "cname_name" {
  description = "Route 53 cname name"
}
variable "cname_record" {
  description = "Route 53 cname record"
}

# api
variable "api_a_alias_name" {
  description = "Route 53 api a alias name"
}
variable "api_a_alias_zone_id" {
  description = "Route 53 api a alias zone id"
}
variable "api_soa_record" {
  description = "Route 53 api soa record"
}
variable "api_cname_name" {
  description = "Route 53 api cname name"
}
variable "api_cname_record" {
  description = "Route 53 api cname record"
}
variable "aws_account_id" {
  description = "The AWS Account ID"
  type        = string
}
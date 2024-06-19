variable "zone_id" {
  description = "The AWS zone id"
  type        = string
}

variable "mail_servers" {
  description = "The mail server records"
  type        = list(string)
}

variable "dmarc" {
  description = "The dmarc settings TXT record value"
  type        = string
}

variable "spf" {
  description = "The SPF settings TXT record value"
  type        = string
}

variable "verification" {
  description = "The verification TXT record value"
  type        = string
  nullable    = true
  default     = null
}

variable "domain_keys" {
  description = "The DKIM domain key mappings"
  type        = map(string)
}

variable "ttl" {
  description = "The TTL for DNS records"
  type        = number
  default     = 10800
}

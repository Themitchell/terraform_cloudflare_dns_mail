resource "cloudflare_record" "mx" {
  for_each = { for idx, server in var.mail_servers : idx + 1 => server }

  zone_id = var.zone_id
  name    = "@"
  type    = "MX"
  ttl     = var.ttl
  value    = each.value
  priority = each.key
}

resource "cloudflare_record" "domain_key_cname" {
  for_each = var.domain_keys

  zone_id = var.zone_id
  name    = each.key
  type    = "CNAME"
  ttl     = var.ttl
  value   = each.value
}

resource "cloudflare_record" "dmarc_txt" {
  zone_id = var.zone_id
  name    = "_dmarc"
  type    = "TXT"
  ttl     = var.ttl
  value = var.dmarc
}

resource "cloudflare_record" "spf_txt" {
  zone_id = var.zone_id
  name    = "@"
  type    = "TXT"
  ttl     = var.ttl
  value   = var.spf
}

resource "cloudflare_record" "verification_txt" {
  count = var.verification == null ? 0 : 1

  zone_id = var.zone_id
  name    = "@"
  type    = "TXT"
  ttl     = var.ttl
  value   = var.verification
}

resource "cloudflare_zone" "sharlai" {
  zone = "sharlai.pp.ua"
}

resource "cloudflare_record" "sharlai" {
  zone_id = cloudflare_zone.sharlai.id
  name    = "@"
  value   = var.color != "green" ? "${aws_alb.alb_blue.dns_name}" : "${aws_alb.alb_green.dns_name}"
  type    = "CNAME"
  proxied = true
  ttl     = 1
}

resource "cloudflare_zone_settings_override" "sharlai" {
  zone_id = cloudflare_zone.sharlai.id
  settings {
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

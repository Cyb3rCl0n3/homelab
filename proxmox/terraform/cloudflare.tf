resource "random_id" "tunnel_secret" {
  byte_length = 32
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "homelab" {
  account_id    = var.CLOUDFLARE_ACCOUNT_ID
  name          = "homelab"
  tunnel_secret = random_id.tunnel_secret.b64_std
  config_src    = "cloudflare"
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "homelab" {
  account_id = var.CLOUDFLARE_ACCOUNT_ID
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.homelab.id

  config = {
    ingress = [
      {
        hostname = "workspaces.${var.CLOUDFLARE_ZONE}"
        service  = "https://10.10.40.10:443"
        origin_request = {
          no_tls_verify = true # Kasm ships a self-signed cert by default
        }
      },
      {
        service = "http_status:404" # required catch-all, must be last
      }
    ]
  }
}

# The connector token isn't an attribute of the tunnel resource itself in
# this provider version — it's fetched via this data source.
data "cloudflare_zero_trust_tunnel_cloudflared_token" "homelab" {
  account_id = var.CLOUDFLARE_ACCOUNT_ID
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.homelab.id
}

resource "cloudflare_dns_record" "kasm" {
  zone_id = var.CLOUDFLARE_ZONE_ID
  name    = "workspaces"
  type    = "CNAME"
  # Stable Cloudflare convention, not an exported attribute of the tunnel
  # resource in this provider version.
  content = "${cloudflare_zero_trust_tunnel_cloudflared.homelab.id}.cfargotunnel.com"
  ttl     = 1 # must be 1 ("automatic") when proxied
  proxied = true
}

output "cloudflare_tunnel_token" {
  value     = data.cloudflare_zero_trust_tunnel_cloudflared_token.homelab.token
  sensitive = true
}

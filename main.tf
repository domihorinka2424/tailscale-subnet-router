terraform {
  required_providers {
    tailscale = {
      source = "tailscale/tailscale"
      version = "0.17.1"
    }
  }
}

provider "tailscale" {
  api_key = var.tailscale_api_key
}

# Create an authentication key for the subnet router (Raspberry Pi)
resource "tailscale_tailnet_key" "subnet_router_key" {
  reusable      = true
  preauthorized = true
}

# Output the authentication key for the subnet router
output "subnet_router_auth_key" {
  value = tailscale_tailnet_key.subnet_router_key.id
}

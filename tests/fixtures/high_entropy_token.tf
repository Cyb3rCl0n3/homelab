# DETECTION FIXTURE — not real infrastructure. Never planned or applied.
#
# CKV_SECRET_6 — Base64 High Entropy String. Entropy-based detection: fires on
# the VALUE, ignoring attribute name and resource type. That indifference is the
# only reason Checkov finds anything in a Proxmox repo, where no built-in
# terraform-framework check matches any resource we declare.
#
# This gap was real once: .checkov.yaml listed framework: [terraform] only,
# excluding secrets, so a hardcoded credential passed while the gate stayed green.
resource "detection_canary" "high_entropy" {
  api_token = "fakeapitoken"
}

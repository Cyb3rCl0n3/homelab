# DETECTION FIXTURE — not real infrastructure. Never planned or applied.
#
# CKV_SECRET_2 — AWS Access Key. Format-based detection: matches the key SHAPE,
# not entropy. A different code path from CKV_SECRET_6, so it fails independently
# if the secrets plugin set is ever narrowed.
#
# Value is AWS's own documented example key, not a live credential.
resource "detection_canary" "aws_access_key" {
  access_key = "AKIAIOSFODNN7EXAMPLE"
  secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
}

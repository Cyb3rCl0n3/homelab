# DETECTION FIXTURE — not real infrastructure. Never planned or applied.
#
# A hardcoded credential the Checkov `secrets` framework must flag. If this
# stops being detected, the scan gate has silently broken. That gap was real
# here once: `.checkov.yaml` restricted `framework` to `terraform` only, which
# excludes the secrets framework, so hardcoded credentials went unnoticed while
# the pipeline stayed green.
#
# The resource type is deliberately fictional, so the ONLY thing any scanner
# can find in this file is the secret. That keeps the assertion simple and
# unambiguous: any finding at all means secret detection is working.
#
# This directory is outside the real scan scope (`proxmox/terraform`), so these
# canaries cannot fail the production gate.
resource "detection_canary" "hardcoded_token" {
  api_token = "fakeapitoken"
}

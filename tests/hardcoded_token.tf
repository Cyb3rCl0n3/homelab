# DETECTION FIXTURE — not real infrastructure, never planned or applied.
#
# A hardcoded credential the Checkov `secrets` framework must flag. If this
# stops being detected, the scan gate has silently broken (this exact gap
# existed once: `.checkov.yaml` restricted `framework` to `terraform` only,
# which excludes the secrets framework entirely).
#
# The resource type is deliberately fictional so the ONLY thing a scanner can
# find here is the secret — a terraform misconfig finding would otherwise make
# this test pass for the wrong reason.
resource "detection_canary" "hardcoded_token" {
  api_token = "fakeapitoken"
}

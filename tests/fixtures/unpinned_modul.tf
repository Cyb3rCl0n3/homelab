# DETECTION FIXTURE — not real infrastructure. Never planned or applied.
#
# CKV_TF_1 / CKV_TF_2 — module sources must be pinned to a commit hash and a
# version tag. The only terraform-framework checks that can apply to this repo;
# dormant in production because every real module is a local path (./modules/vm).
#
# Pinned here so the terraform framework is proven live, independently of the
# secrets framework. Without this, framework: [secrets] alone would still pass.
module "unpinned" {
  source = "git::https://github.com/example/mod.git"
}

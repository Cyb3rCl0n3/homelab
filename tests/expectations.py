"""Fixture -> expected finding IDs, for both scanners.

Each fixture proves a distinct detection code path (key-shape matching,
entropy matching, PEM-header matching, or terraform-framework module-source
checks). An empty list is a deliberate claim that a scanner has NO coverage
here — declared explicitly so the meta-test can catch fixtures nobody wrote
expectations for, instead of silently skipping them.
"""

FIXTURES = {
    "aws_access_key.tf": {
        "checkov": ["CKV_SECRET_2"],
        "trivy": [],
    },
    "high_entropy_token.tf": {
        "checkov": ["CKV_SECRET_6"],
        "trivy": [],
    },
    "private_key.tf": {
        "checkov": ["CKV_SECRET_13"],
        "trivy": ["private-key"],
    },
    "unpinned_modul.tf": {
        "checkov": ["CKV_TF_1", "CKV_TF_2"],
        "trivy": [],
    },
}

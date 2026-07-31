# IaC Pipeline

## Workflows

| Workflow | Runner | Purpose |
|---|---|---|
| `trigger.yml` | `[self-hosted, homelab]` | The pipeline itself: scan → plan/apply → ansible |
| `workflow.yml` | `ubuntu-latest` | Lints and security-audits the workflow files (actionlint + zizmor) |
| `detection-validation.yml` | `ubuntu-latest` | Proves the scan gate still detects known-bad input |
| `scorecard.yml` | `ubuntu-latest` | OpenSSF Scorecard supply-chain scoring + badge |

## Triggers ([trigger.yml](.github/workflows/trigger.yml))

This is the main workflow handling the infrastructure using Terraform and Ansible alongside with SAST tools such as Trivy and Checkov.

|Event|Path|Jobs|
|---|---|---|
|Pull request|any|`terraform-scan` → `terraform-plan`|
|Push to main|`proxmox/terraform/**`, `proxmox/ansible/**`, `.github/workflows/**`| `terraform-scan` → `terraform-apply` → `ansible-run`

### Diagram
```mermaid
flowchart LR

  subgraph TL["Terraform Scan"]
    A[Format] --> B[Validate] --> C[Trivy] --> D[Checkov] --> E[SARIF report] --> N[Gate on findings]
  end

  TL --> F

  F{Which event?} -->|PR merged<br/>push to main| TR
  F -->|PR opened<br/>or updated| BR

  subgraph BR["Terraform Plan"]
    G[Terraform plan]
  end

  subgraph TR["Terraform Apply"]
    I[Terraform plan] --> J[Terraform apply]
  end

  subgraph TRR["Ansible Run"]
    K[Write SSH key] --> L[Run Ansible playbook] --> M[Cleanup SSH key]
  end

  TR --> TRR
```


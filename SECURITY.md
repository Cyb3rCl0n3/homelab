# Security Policy

This is a personal homelab and learning project, maintained by a single person
on a best-effort basis. There are no released versions or support SLAs.

## Reporting a Vulnerability

If you find a security issue in this repository — for example a leaked secret, an
insecure default, an injectable workflow pattern, or a vulnerable dependency —
please report it **privately** rather than opening a public issue.

- Preferred: GitHub's private vulnerability reporting —
  **Security → Report a vulnerability**
  (<https://github.com/Cyb3rCl0n3/homelab/security/advisories/new>).

Please include steps to reproduce and the potential impact. Reports are
acknowledged and addressed as time permits.

## Scope

This repository contains Infrastructure-as-Code (Terraform / Ansible) and CI
configuration for a private homelab. Secrets are intentionally excluded from
version control (see `.gitignore`). Reports about accidentally committed secrets,
insecure CI/workflow patterns, or vulnerable dependencies are especially welcome.

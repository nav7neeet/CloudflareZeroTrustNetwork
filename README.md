# Cloudflare Zero Trust — Terraform Project

A Terraform project to demonstrate the Zero Trust Newtwork Access (ZTNA) using Cloudflare. It automates the end-to-end setup of **Cloudflare ZTNA** — from identity provider integration to web filtering and TLS inspection.

This project is the companion codebase for the **Cloudflare Zero Trust blog series** on [blog.mishraji.org](https://blog.mishraji.org).

---

## Quick Start

### Prerequisites

- Terraform `1.14.6`
- A [Cloudflare Zero Trust](https://www.cloudflare.com/en-in/plans/zero-trust-services/) account (free tier works)
- An AWS account with Cognito permissions

> For complete setup instructions, prerequisites, and testing steps — refer to the blog series below. Each part walks through exactly what resources are provisioned and how to verify them.

> For simplicity, most of the terraform modules are commented out. Follow the blog posts below and uncomment the modules which are required.

### Run

```bash
git clone <repo-url>
cd <repo-name>
terraform init
terraform plan
terraform apply
```


| Part | Topic |
|------|-------|
| [Part 0](https://blog.mishraji.org/posts/cloudflare-ztna-part-0/) | Cloudflare One Client setup with AWS Cognito as the Identity Provider (OIDC) |
| [Part 1](https://blog.mishraji.org/posts/cloudflare-ztna-part-1/) | Web Filtering — DNS, HTTP, and Network firewall policies |
| [Part 2](https://blog.mishraji.org/posts/cloudflare-ztna-part-2/) | TLS Inspection and Data Loss Prevention (DLP) |
| [Part 3](https://blog.mishraji.org/posts/cloudflare-ztna-part-3/) | Private Resource Access |

---

## Contributing

This is a **live project** and community contributions are very much welcome.

Whether you want to fix a bug, add support for a new Cloudflare feature, improve variable handling, or extend the web filtering categories — feel free to open a PR or raise an issue.

**How to contribute:**

1. Fork the repo
2. Create a feature branch (`git checkout -b feature/your-feature`)
3. Commit your changes
4. Open a pull request with a clear description of what you changed and why

If you are unsure whether your idea fits the project, open an issue first and we can discuss it.
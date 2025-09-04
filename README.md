# Azure Infrastructure Patterns

Enterprise-grade Azure infrastructure templates with DevOps best practices

## Quick Start

### 1. Clone this repository at work

```bash
git clone https://github.com/YOUR_USERNAME/azure-infrastructure-patterns.git
cd azure-infrastructure-patterns
```

### 2. Discover your current Azure setup (SAFE - read-only)

```bash
az login
az account set --subscription "YOUR_SUBSCRIPTION_ID"
./scripts/setup/discover-current-setup.sh
```

### 3. Use GitHub Copilot to analyze existing infrastructure

Open VS Code with both your existing Terraform files AND this repository:

**Key Prompts:**

- "Analyze my existing Azure infrastructure and explain the architecture"
- "How can I implement blue-green deployments with my current VMSS setup?"
- "Help me customize terraform.tfvars with my actual values"
- "Create a migration plan from current to modern patterns"

### 4. Customize templates

```bash
# Find all customization points
grep -r "TODO:" . --exclude-dir=.git

# Start with dev environment
cp terraform/environments/dev/terraform.tfvars.example terraform/environments/dev/terraform.tfvars
# Edit with your company-specific values
```

## What's Included

- **Terraform Modules**: Networking, blue-green VMSS, PostgreSQL, storage, security
- **Packer Templates**: Immutable Windows images with security hardening
- **GitLab CI/CD**: Complete pipeline with security gates and automated testing
- **Architecture Patterns**: Blue-green deployments, immutable infrastructure
- **Security & Compliance**: CIS benchmarks, automated policy enforcement
- **Monitoring**: Comprehensive observability with Azure Monitor

## Architecture

This implements:

- Immutable Infrastructure with Packer
- Blue-Green Deployments for zero downtime
- Defense in Depth security
- Infrastructure as Code with Terraform
- GitOps with automated CI/CD

## Documentation

- [Architecture Overview](docs/architecture/README.md)
- [Deployment Procedures](docs/runbooks/deployment-procedures.md)
- [Best Practices](docs/best-practices/)
- [Troubleshooting](docs/runbooks/troubleshooting-guide.md)

## License

MIT License - Free to use and modify for your organization.

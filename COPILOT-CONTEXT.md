# Azure Infrastructure Modernization Context Document

## PROJECT OVERVIEW & GOALS

I'm modernizing Azure infrastructure using **DevOps best practices** while working within enterprise constraints.

### Current Architecture
- **Source Control**: GitLab with CI/CD pipelines
- **Deployment Orchestration**: Octopus Deploy (handles environment promotion, approvals, deployment steps)
- **Infrastructure**: Azure with Terraform (VMSSs, PostgreSQL Flexible Server, Storage Accounts)
- **Flow**: `GitLab Build → Octopus Package → Deploy to Azure VMSS → Manual validation`

### Target Architecture (Modern DevOps)
- **Immutable Infrastructure**: VM images built with Packer, versioned and hardened
- **Blue-Green Deployments**: Zero-downtime deployments with instant rollback via VMSS pairs
- **Infrastructure as Code**: Terraform modules with best practices
- **Automated Security**: CIS benchmarks, vulnerability scanning, compliance automation
- **Comprehensive Monitoring**: Golden signals, SLOs, automated alerting

### Key Constraints
- ❌ **Cannot use AKS/Kubernetes** (organizational constraint)
- ✅ **Must use VMSSs** for compute
- ✅ **Must use Azure Database for PostgreSQL** 
- ✅ **Must use Azure Storage** (blob, file, queue)
- ✅ **Must integrate with existing Octopus Deploy** workflows
- ✅ **Must maintain GitLab CI/CD** integration

## STRATEGIC APPROACH

### Blue-Green Deployment Strategy with VMSSs
Instead of single VMSS per environment:
```
Current: App → Single VMSS (downtime during updates)

Target:  App Gateway → Blue VMSS (live traffic)
                   → Green VMSS (new version)
         
Deployment: Deploy to Green → Health Check → Switch Traffic → Blue becomes standby
```

### Integration with Octopus Deploy
Three integration options identified:

**Option A: Infrastructure Blue-Green + Octopus Apps**
- Terraform creates blue-green VMSS infrastructure  
- Octopus deploys applications to target environment (blue or green)
- Application Gateway handles traffic switching
- Best for teams comfortable with infrastructure automation

**Option B: Octopus-Orchestrated Blue-Green**
- Octopus manages entire blue-green process
- Deployment steps handle VMSS updates and traffic switching  
- Leverages Octopus's built-in deployment features
- Best for teams heavily invested in Octopus workflows

**Option C: Hybrid Approach** (RECOMMENDED)
- Infrastructure provides blue-green capability
- Octopus uses deployment targets for blue/green environments
- Best of both infrastructure automation and Octopus orchestration

### DORA Metrics Goals
- **Deployment Frequency**: From weekly/monthly to multiple per day
- **Lead Time for Changes**: From hours/days to minutes
- **Change Failure Rate**: From 10-15% to <5%  
- **Mean Time to Recovery**: From hours to <2 minutes (traffic switch)

## PHASE 1 FOCUS: DEV ENVIRONMENT

Start with development environment because:
- ✅ Lower risk for experimentation
- ✅ Faster iteration and learning
- ✅ Team can adapt to new patterns safely
- ✅ Proof of concept for business value
- ✅ Pipeline validation without production impact

---

## CONTEXT FOR AI ASSISTANT

I need you to act as a **Senior DevOps Engineer/Cloud Architect** with expertise in:
- Azure infrastructure patterns and best practices
- Terraform module design and enterprise adoption
- Octopus Deploy integration strategies  
- GitLab CI/CD pipeline optimization
- Blue-green deployment patterns with VMSSs
- Security and compliance automation
- Infrastructure modernization and migration planning

Help me analyze my current setup, design modernization strategies, create implementation plans, and provide specific technical guidance for transitioning to modern DevOps practices while working within organizational constraints.

Focus on **practical, implementable solutions** that provide incremental value while maintaining stability and security.

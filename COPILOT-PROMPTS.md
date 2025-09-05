# GitHub Copilot Prompts for Azure Infrastructure Modernization

Copy and paste these prompts into GitHub Copilot Chat after sharing the COPILOT-CONTEXT.md file.

## Initial Analysis Prompts

### Understanding Current State
```
I've provided complete context about my Azure infrastructure modernization project in COPILOT-CONTEXT.md. First, analyze my existing Terraform files and current VMSS configuration. What's the current architecture and what are the biggest modernization opportunities?
```

```
Based on the context provided, examine my current infrastructure and identify:
1. Current VMSS configuration and scaling policies
2. Network topology and security setup
3. Database and storage configurations
4. Deployment patterns and potential bottlenecks
5. Security gaps and compliance opportunities
```

### Octopus Deploy Integration Analysis
```
Help me discover and document my current Octopus Deploy integration. Based on the context, what questions should I ask and what should I document about my GitLab→Octopus→Azure deployment flow?
```

```
Analyze how my current Octopus Deploy projects handle VMSS deployments. What changes would be needed to support blue-green deployments with my existing Octopus workflows?
```

## Planning and Design Prompts

### Blue-Green Migration Strategy
```
Using the blue-green deployment strategy outlined in the context, help me design a migration plan for my dev environment VMSS. What's the safest approach to transition from single VMSS to blue-green without breaking existing Octopus workflows?
```

```
Design a comprehensive blue-green VMSS architecture using Terraform that:
1. Integrates with my existing Octopus Deploy processes
2. Provides zero-downtime deployments
3. Includes Application Gateway traffic switching
4. Supports automated rollback procedures
5. Maintains current security and compliance requirements
```

### Infrastructure Modernization
```
Create a detailed Terraform module structure for blue-green VMSS deployment that follows enterprise best practices and integrates with my current Azure setup.
```

```
Help me design an immutable VM image pipeline using Packer that:
1. Builds from my current base images
2. Includes security hardening and CIS compliance
3. Integrates with my GitLab CI/CD pipeline
4. Supports versioning and rollback capabilities
5. Works with Octopus Deploy application deployments
```

## Implementation Prompts

### Terraform Module Development
```
Help me create a Terraform module for blue-green VMSS deployment with these requirements:
[List your specific requirements based on current setup]
```

```
Review my existing Terraform code and suggest specific changes to implement blue-green deployment patterns while maintaining compatibility with my current Octopus Deploy processes.
```

### Octopus Integration Updates
```
Design Octopus Deploy project templates that leverage blue-green infrastructure for zero-downtime deployments. Show me the deployment process steps and variable configurations needed.
```

```
What changes do I need to make to my GitLab CI/CD pipeline to support blue-green deployments with Octopus orchestration? Provide specific YAML configurations.
```

### Security and Compliance
```
Review my current Azure security configuration and recommend specific improvements for CIS compliance and defense-in-depth security, particularly for blue-green VMSS deployments.
```

```
Design a comprehensive secrets management strategy using Azure Key Vault that integrates with both my Terraform infrastructure deployment and Octopus Deploy application deployment.
```

## Troubleshooting and Optimization Prompts

### Performance Analysis
```
Analyze my current VMSS auto-scaling configuration and recommend optimizations for:
1. Faster scale-out response times
2. Cost-effective scaling policies  
3. Predictive scaling based on usage patterns
4. Integration with blue-green deployment switching
```

### Migration Validation
```
Create a comprehensive testing and validation plan for migrating from single VMSS to blue-green deployment, including:
1. Infrastructure validation tests
2. Application deployment validation
3. Traffic switching validation
4. Rollback procedure testing
5. Performance benchmarking
```

### Monitoring and Observability
```
Design a comprehensive monitoring strategy for blue-green VMSS deployments including:
1. Golden Signals monitoring (latency, traffic, errors, saturation)
2. Deployment success/failure tracking
3. Blue-green switch validation
4. Automated alerting and escalation procedures
5. SLI/SLO definitions and tracking
```

## Advanced Scenarios

### Multi-Environment Strategy
```
Help me design a strategy for promoting blue-green deployment patterns from dev to staging to production, considering:
1. Environment-specific configurations
2. Octopus Deploy approval processes
3. Risk mitigation and rollback procedures
4. Team training and adoption
```

### Disaster Recovery
```
Design a disaster recovery strategy for blue-green VMSS deployments that includes:
1. Cross-region replication capabilities
2. Database failover procedures
3. DNS and traffic management
4. Recovery time and point objectives
5. Regular DR testing procedures
```

## Quick Reference Commands

### Discovery Commands (Safe - Read-Only)
```bash
# Basic Azure resource discovery
az group list --output table
az vmss list --output table
az network vnet list --output table
az postgres flexible-server list --output table
az storage account list --output table

# Detailed VMSS analysis
az vmss list --query "[].{Name:name, ResourceGroup:resourceGroup, Capacity:sku.capacity, Size:sku.name, Location:location}" --output table
az vmss show --name "VMSS_NAME" --resource-group "RG_NAME" --query "{Name:name, Capacity:sku.capacity, AutoScale:upgradePolicy.automaticOSUpgradePolicy}"
```

### Terraform Validation
```bash
# Validate Terraform configurations
terraform fmt -check -recursive
terraform validate
terraform plan -var-file="terraform.tfvars"
```

### Octopus CLI Commands
```bash
# Package and deploy via Octopus CLI
octo pack --id="PROJECT_NAME" --version="VERSION"
octo create-release --project="PROJECT_NAME" --deployTo="ENVIRONMENT"
```

## Usage Instructions

1. **Start each session** by sharing the COPILOT-CONTEXT.md content with GitHub Copilot
2. **Use prompts sequentially** - start with analysis, then planning, then implementation
3. **Customize prompts** with your specific resource names, requirements, and constraints
4. **Iterate and refine** based on the responses and your current infrastructure discoveries
5. **Document decisions** and create your own prompts as you learn more about your setup

Remember: GitHub Copilot can see your actual code files, so it will provide specific recommendations based on your real infrastructure configuration.

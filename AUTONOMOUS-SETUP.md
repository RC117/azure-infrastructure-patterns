# Autonomous Setup Guide

## At Work - 5 Minute Setup

### 1. Clone Repository
```bash
git clone https://github.com/YOUR_USERNAME/azure-infrastructure-patterns.git
cd azure-infrastructure-patterns
```

### 2. Open in VS Code
```bash
code .
```

### 3. Start GitHub Copilot Chat
- Open GitHub Copilot Chat panel in VS Code
- Copy and paste the **entire contents** of `COPILOT-CONTEXT.md` into the chat
- Wait for Copilot to confirm it has the context

### 4. Begin Analysis
Copy this prompt into Copilot Chat:
```
I've provided complete context about my Azure infrastructure modernization project. First, analyze my existing Terraform files and current VMSS configuration. What's the current architecture and what are the biggest modernization opportunities?
```

### 5. Continue with Discovery
Use prompts from `COPILOT-PROMPTS.md` to guide your analysis and implementation.

## Discovery Commands (Safe - Read-Only)

```bash
# Login to Azure
az login
az account set --subscription "YOUR_DEV_SUBSCRIPTION_ID"

# Basic infrastructure discovery
az group list --output table
az vmss list --output table
az network vnet list --output table
az postgres flexible-server list --output table
az storage account list --output table

# Detailed VMSS analysis
az vmss list --query "[].{Name:name, ResourceGroup:resourceGroup, Capacity:sku.capacity, Size:sku.name}" --output table
```

## Key Files for Reference

- **`COPILOT-CONTEXT.md`** - Share this with GitHub Copilot first
- **`COPILOT-PROMPTS.md`** - Use these prompts for guidance
- **`terraform/`** - Reference templates for your implementation
- **`octopus/`** - Octopus Deploy integration patterns

## Workflow

1. **Analyze** current infrastructure with Copilot
2. **Design** blue-green architecture with Copilot guidance  
3. **Implement** incrementally starting with dev environment
4. **Validate** and test thoroughly before moving to staging/prod
5. **Document** decisions and learnings

## Success Indicators

You'll know it's working when GitHub Copilot provides:
- ✅ Specific analysis of your actual Terraform files
- ✅ Customized recommendations for your infrastructure
- ✅ Concrete implementation steps
- ✅ Risk assessment and mitigation strategies

The context document gives Copilot everything it needs to be your autonomous DevOps architect!

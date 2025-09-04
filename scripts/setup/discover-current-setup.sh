#!/bin/bash
# Azure Infrastructure Discovery Script - READ-ONLY operations

set -e

echo "🔍 Azure Infrastructure Discovery Tool"
echo "======================================="
echo "⚠️  This script performs READ-ONLY operations - completely safe to run!"
echo ""

# Check prerequisites
if ! command -v az &> /dev/null; then
    echo "❌ Azure CLI is not installed. Please install it first."
    exit 1
fi

# Check if logged in
if ! az account show > /dev/null 2>&1; then
    echo "❌ Please login to Azure first: az login"
    exit 1
fi

# Get current subscription info
CURRENT_SUB=$(az account show --query "name" -o tsv)
CURRENT_SUB_ID=$(az account show --query "id" -o tsv)

echo "📍 Current subscription: $CURRENT_SUB"
echo "🆔 Subscription ID: $CURRENT_SUB_ID"
echo ""

# Create output directory
OUTPUT_DIR="discovery-output"
mkdir -p "$OUTPUT_DIR"

# Function to run discovery commands
run_discovery() {
    local description="$1"
    local filename="$2"
    local command="$3"
    
    echo "🔎 $description..."
    if eval "$command" > "$OUTPUT_DIR/$filename" 2>/dev/null; then
        local count=$(wc -l < "$OUTPUT_DIR/$filename")
        echo "   ✅ Saved to $filename ($count items)"
    else
        echo "   ⚠️  No data found - saved empty file"
        echo "No data found" > "$OUTPUT_DIR/$filename"
    fi
}

# Discover resources
run_discovery "Discovering Resource Groups" "resource-groups.txt" \
    "az group list --query '[].{Name:name, Location:location}' --output table"

run_discovery "Discovering Virtual Networks" "vnets.txt" \
    "az network vnet list --query '[].{Name:name, ResourceGroup:resourceGroup, Location:location, AddressSpace:addressSpace}' --output table"

run_discovery "Discovering Virtual Machine Scale Sets" "vmss.txt" \
    "az vmss list --query '[].{Name:name, ResourceGroup:resourceGroup, Location:location, Capacity:sku.capacity, Size:sku.name}' --output table"

run_discovery "Discovering Application Gateways" "app-gateways.txt" \
    "az network application-gateway list --query '[].{Name:name, ResourceGroup:resourceGroup, Location:location, Tier:sku.tier}' --output table"

run_discovery "Discovering PostgreSQL Servers" "postgresql.txt" \
    "az postgres flexible-server list --query '[].{Name:name, ResourceGroup:resourceGroup, Location:location, Version:version}' --output table"

run_discovery "Discovering Storage Accounts" "storage.txt" \
    "az storage account list --query '[].{Name:name, ResourceGroup:resourceGroup, Location:location, Kind:kind}' --output table"

# Create summary
cat > "$OUTPUT_DIR/SUMMARY.md" << EOF
# Infrastructure Discovery Summary

**Subscription:** $CURRENT_SUB  
**Subscription ID:** $CURRENT_SUB_ID  
**Discovery Date:** $(date)

## Files Generated

- resource-groups.txt - All resource groups
- vnets.txt - Virtual networks and address spaces
- vmss.txt - Virtual Machine Scale Sets
- app-gateways.txt - Application Gateways
- postgresql.txt - PostgreSQL databases
- storage.txt - Storage accounts

## Next Steps

1. **Use GitHub Copilot** to analyze your existing Terraform:
   - Open existing Terraform files in VS Code
   - Ask: "Analyze this infrastructure and suggest improvements"
   
2. **Customize templates**:
   - Update terraform.tfvars.example with discovered values
   - Replace COMPANY_NAME placeholders

3. **Plan migration**:
   - Start with dev environment
   - Use blue-green pattern for zero-downtime migration


SCRIPTS_DIR := scripts

TF_DIR := terraform
TF_VARS := terraform.tfvars

.PHONY: init plan apply destroy validate output fmt

init:
	@echo "🔧 Initializing Terraform..."
	cd $(TF_DIR) && terraform init

plan:
	@echo "📋 Generating execution plan..."
	cd $(TF_DIR) && terraform plan -var-file=$(TF_VARS)

apply:
	@echo "🚀 Applying infrastructure changes..."
	cd $(TF_DIR) && terraform apply -var-file=$(TF_VARS) -auto-approve

destroy:
	@echo "💣 Destroying infrastructure..."
	cd $(TF_DIR) && terraform destroy -var-file=$(TF_VARS) -auto-approve

validate:
	@echo "✅ Validating Terraform configuration..."
	cd $(TF_DIR) && terraform validate

output:
	@echo "📤 Retrieving Terraform outputs..."
	cd $(TF_DIR) && terraform output

fmt:
	@echo "🧹 Formatting Terraform code..."
	cd $(TF_DIR) && terraform fmt -recursive

test:
	@echo "🧪 Running Kyverno CLI tests..."
	cd $(SCRIPTS_DIR) && bash test-policies.sh
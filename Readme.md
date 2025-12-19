
# Wealth-Infra 🚀

**End-to-End Azure Infrastructure Automation with Terraform (DevSecOps Focus)**

This repository demonstrates a **real-world DevSecOps-oriented Infrastructure as Code (IaC) implementation** using Terraform on Microsoft Azure, with CI/CD automation and infrastructure testing.

The project focuses on **secure-by-design**, **modular Terraform**, and **pipeline-driven deployments**, aligning with modern DevSecOps practices.

---

## 🎯 Project Objectives

* Build Azure infrastructure using **modular Terraform**
* Apply **DevSecOps principles** to infrastructure code
* Validate infrastructure **before deployment**
* Enable **end-to-end automated deployments**
* Follow **enterprise-grade Azure best practices**

---

## 🧱 Infrastructure Architecture

The infrastructure includes:

* Azure Resource Group
* Virtual Network (VNet)
* Segregated Subnets:

  * Frontend Subnet
  * Backend Subnet
  * AzureBastionSubnet (isolated)
* Azure Bastion (secure VM access)
* Linux Virtual Machines (no public IPs)
* Azure Storage Account & Containers
* Azure SQL Server & Database
* Azure Key Vault (secrets management)

🔐 **Security-first design**:

* No public IPs on VMs
* Bastion used for secure access
* Subnet isolation
* Sensitive values handled via variables

---

## 📁 Repository Structure

```
Wealth-Infra/
│
├── Env-Infra/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── providers.tf
│   │   ├── backend.tf
│   │   └── terraform.tfvars
│
├── dev-agent/
│   ├── module/
│   └── parent/
│
├── terratest/
│   ├── go.mod
│   ├── terraform/
│   └── test/
│
├── dev-Infra-deploy.yml
├── multienv-Infra-deploy.yml
├── prod-Infra-deploy.yml
└── .gitignore
```

---

## 🔐 DevSecOps Implementation

This project integrates **security and quality checks early in the pipeline**.

### 1️⃣ Terraform Code Quality (TFLint)

* Validates Terraform syntax and best practices
* Detects misconfigurations early
* Prevents bad code from reaching deployment stages

> *Shift-left approach for infrastructure quality*

---

### 2️⃣ Terraform Security Scanning (TFSec)

* Identifies security risks such as:

  * Public exposure
  * Insecure network rules
  * Unencrypted resources
* Ensures compliance with cloud security best practices

> *Security is treated as code*

---

### 3️⃣ Infrastructure Testing (Terratest)

* Validates Terraform code by deploying real Azure resources
* Tests expected outputs and behavior
* Destroys resources after testing

> *Infrastructure is tested like application code*

---

## 🔄 End-to-End CI/CD Flow (Azure DevOps)

The deployment pipeline follows this **DevSecOps lifecycle**:

```
Terraform Validate
   ↓
TFLint (Code Quality)
   ↓
TFSec (Security Scan)
   ↓
Terratest (Infra Testing)
   ↓
Terraform Plan
   ↓
Terraform Apply
```

This ensures:

* Early failure for bad or insecure code
* Reliable and repeatable deployments
* Controlled promotion across environments

---

## ⚙️ Terraform Backend & State Management

* Remote backend configured using **Azure Storage Account**
* State locking enabled
* Environment-specific state files
* Prevents state conflicts in team environments

---

## 🚀 Deployment Example (Dev Environment)

```bash
cd Env-Infra/dev
terraform init
terraform plan
terraform apply
```

---

## 🛠 Tools & Technologies

* **Terraform** – Infrastructure as Code
* **Azure DevOps** – CI/CD automation
* **Azure CLI** – Authentication & management
* **Terratest (Go)** – Infrastructure testing
* **TFLint** – Terraform linting
* **TFSec** – Terraform security scanning
* **Azure Bastion** – Secure VM access

---

## 🧠 DevSecOps Key Takeaways

* Infrastructure code is **version-controlled**
* Security checks are **automated**
* Testing is **mandatory before deployment**
* Pipelines act as **quality gates**
* Infrastructure changes are **auditable and repeatable**

---

## 👤 Author

**Suraj**
Cloud / DevOps Engineer
Azure • Terraform • DevSecOps • CI/CD • Infrastructure Automation

---

## 📌 Disclaimer

This project is created for **learning, hands-on practice**, following real-world enterprise patterns.

---


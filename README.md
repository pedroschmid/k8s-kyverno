
# 🔐 Kubernetes Hardening with Kyverno

## 🎯 Objective

This project demonstrates how to apply security, compliance, and operational standards to a Kubernetes cluster using **Kyverno policies**, managed and deployed through **Terraform** and **Helm**.

With this project, you will learn how to:

- 🛡️ Enforce Kubernetes best practices using Kyverno (e.g. resource limits, labeling, restricted privileges)
- 📦 Use Terraform to provision the cluster and apply Kubernetes manifests
- ⚙️ Deploy Kyverno via Helm charts
- 🧪 Test policies locally using `kyverno-cli` with valid and invalid resources
- ✅ Ensure that workloads follow strict compliance rules

---

## 🏗️ Architecture

The infrastructure is fully local and uses Minikube + Terraform:

- **Minikube**: Local Kubernetes cluster managed by Terraform
- **Helm**: Used to install Kyverno into the cluster
- **Kyverno**: Applies and enforces security policies as Kubernetes-native CRDs
- **Terraform**: Manages cluster setup, Helm releases, and policy manifests
- **kyverno-cli**: Validates policies and resource manifests locally (CI-like behavior)

```
Terraform
   │
   ├───► Creates Minikube cluster
   ├───► Installs Kyverno via Helm
   └───► Applies ClusterPolicy manifests via kubectl provider
```

---

## ⚙️ Prerequisites

To run this project locally, you need:

- 🧰 `terraform` >= 1.3
- 🐳 Docker (Minikube uses Docker driver)
- 📦 `minikube`
- 📐 `kubectl`
- ⛵ `helm`
- 🧪 `kyverno` CLI (for local testing)

---

## 🚀 How to Run the Project Locally

### 1. 📁 Clone the repository

```bash
git clone https://github.com/pedroschmid/k8s-kyverno.git
cd k8s-kyverno
```

### 2. ⚙️ Start and provision everything via Terraform

```bash
make init
make apply
```

This will:

- Create a local Minikube cluster
- Install Kyverno via Helm
- Apply all ClusterPolicies defined in `terraform/policies`

---

## 🔬 Testing Kyverno Policies Locally

### 🔁 CLI-Based Validation

The repository includes a test suite using `kyverno-cli` to simulate valid and invalid workloads.

Run:

```bash
make test
```

You will see clear feedback on which resources pass or fail against the policies, such as:

```
✅ Valid manifests (should PASS):
✔ Passed as expected

❌ Invalid manifests (should FAIL):
✔ Rejected as expected
```

The policy test manifests are stored in:

- `manifests/valid/` → resources that **comply**
- `manifests/invalid/` → resources that **violate** policies

---

## 📜 Implemented Policies

| Policy                             | Description                                                |
|-----------------------------------|------------------------------------------------------------|
| require-standard-labels           | Enforces labels: `app`, `env`, and `owner`                |
| require-resources                 | Requires CPU/memory requests and limits                   |
| disallow-privileged-containers    | Blocks `privileged: true` containers                      |
| enforce-readonly-rootfs           | Requires read-only root filesystems                       |
| require-network-policy            | Requires every namespace to have at least one NetworkPolicy |

All policies are located in: `terraform/policies/`

---

## 🧹 How to Clean Up

To destroy all resources, including the cluster:

```bash
make destroy
```

---

## 📁 Project Structure

```
.
├── .vscode/            # Recommended dev settings
├── manifests/          # Test workloads (valid and invalid)
├── scripts/            # CLI testing script with kyverno
├── terraform/          # Infrastructure + policies + helm setup
├── Makefile            # Workflow automation
└── README.md
```

---

## ✍️ Notes for Portfolio Reviewers

This project highlights:

- Strong understanding of Kubernetes policy enforcement with Kyverno
- Automation of full setup using Terraform and Helm
- Separation of concerns: policies, manifests, automation, validation
- Demonstrated ability to test policies statically (pre-cluster)
- Focus on compliance, DevSecOps best practices, and security posture

---

## 📝 License

This project is open-sourced under the MIT License.

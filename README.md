# End-to-End DevSecOps Pipeline for Cloud-Native Apps

This project demonstrates a production-grade **DevSecOps lifecycle**, automating the secure delivery of a multi-tier Node.js application to an **Amazon EKS (Kubernetes)** cluster. By integrating security gates directly into the CI/CD pipeline, this project ensures high deployment velocity without compromising infrastructure or application security.

---

### 🚀 What This Project Solves
* **Vulnerability Management:** Automatically catches high-risk dependencies and container vulnerabilities before they reach production.
* **Infrastructure Misconfiguration:** Prevents insecure cloud setups (like open EKS endpoints) using automated static analysis via Checkov.
* **Deployment Automation:** Eliminates manual Kubernetes manifest updates using automated short-SHA image tagging.
* **Real-time Observability:** Solves the "black box" problem by providing instant visibility into application health post-deployment via Prometheus and Grafana.

---

### 🛠️ Tech Stack & Tools

| Category | Tools Used |
| :--- | :--- |
| **Cloud Provider** | AWS (EKS, VPC, RDS, S3) |
| **Infrastructure as Code** | Terraform |
| **CI/CD Orchestration** | GitHub Actions |
| **Containerization** | Docker & GitHub Container Registry (GHCR) |
| **Security (SCA/SAST)** | npm audit, ESLint, Hadolint |
| **Vulnerability Scanning** | Trivy (Images), Checkov (IaC) |
| **Monitoring & Metrics** | Prometheus & Grafana (Deployed via Helm) |

---

### 🏗️ Solution Architecture

The application is deployed across multiple Kubernetes namespaces to ensure logical isolation. The frontend and backend pods communicate within the cluster, while the monitoring stack (Prometheus/Grafana) provides deep insights into system performance.

![Solution Architecture](./architecture_diagram.png)

---

### 🛡️ DevSecOps Pipeline Workflow

The pipeline utilizes a **"Shift-Left"** security strategy, ensuring that every commit is vetted through multiple security gates before deployment.

1.  **Code Quality:** Linting for Javascript (ESLint) and Dockerfiles (Hadolint) to ensure best practices.
2.  **SCA (Dependency Audit):** Checks for vulnerable third-party libraries using `npm audit`.
3.  **Container Hardening:** Deep scans of the container OS and libraries using Trivy.
4.  **IaC Security:** Static analysis of Terraform and K8s manifests using Checkov to catch misconfigurations.
5.  **GitOps Deployment:** Automated manifest updates and Helm-based monitoring deployment.


---

### 📈 Monitoring & Observability
Post-deployment, the stack is monitored via:
* **Prometheus:** Scraping metrics from the application pods to track error rates and latency.
* **Grafana:** Visualizing infrastructure health and pipeline performance trends.
* **Automated Verification:** The pipeline includes a post-deploy check to verify application health via Prometheus metrics.

---

### 🚦 Getting Started

#### 1. Infrastructure Provisioning
Navigate to the `terraform/` directory and run:
```bash
terraform init
terraform apply --auto-approve

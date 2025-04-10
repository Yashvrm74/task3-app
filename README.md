# 🚀 Provisioning Docker Container Using Terraform on EC2

## ✅ Objective

The goal of this project is to **provision a Docker container** using **Terraform** on a **cloud-hosted Ubuntu EC2 instance**. The container uses a **custom-built Docker image**, mounts a local volume, and uses environment variables — all managed through Infrastructure as Code (IaC).

## 🧩 Tools & Technologies Used

- **Terraform** – To define and provision infrastructure.
- **Docker** – To build and run containerized applications.
- **AWS EC2** – Cloud virtual machine (Ubuntu) as the host environment.
- **Ubuntu Shell (CLI)** – To execute commands and manage configurations.

## 🪜 Step-by-Step Workflow Followed

### 1️⃣ Launched an EC2 Ubuntu Instance

- Created and connected to a fresh Ubuntu instance on AWS EC2.
- Ensured the instance had a public IP for access.

### 2️⃣ Installed Required Tools

- Updated the system.
- Installed **Docker** to run containers.
- Installed **Terraform** to define and manage infrastructure using code.
- Added the current user to the Docker group to avoid using `sudo` with every Docker command.

### 3️⃣ Created a Custom Docker Image

- Designed a simple **Node.js app** inside a Dockerfile.
- Built the Docker image locally on the EC2 instance using Docker.
- This image was not pushed to Docker Hub — it remained local on EC2.

### 4️⃣ Created Terraform Configuration (`main.tf`)

- Initialized a Terraform project.
- Used the **Docker provider** in Terraform to interact with Docker on the EC2 machine.
- Defined:
  - A Docker **image resource** for the custom-built image.
  - A Docker **container resource** that runs the app.
  - A **volume** mount to share files between host and container.
  - **Environment variables** used inside the container.
  - Port mappings to expose the app to the internet.

### 5️⃣ Executed Terraform Commands

- Ran `terraform init` to set up the working directory.
- Ran `terraform plan` to preview the infrastructure that would be created.
- Applied the plan using `terraform apply`, which:
  - Created the Docker image.
  - Started the Docker container using that image.
- Verified the app was running and accessible via the EC2 public IP.

### 6️⃣ Verified the Setup

- Used Docker CLI to check running containers (`docker ps`).
- Visited the EC2 public IP in the browser to confirm the Node.js app was serving a response.
- Mounted volume data and env vars were checked inside the container.

### 7️⃣ Cleaned Up Resources

- Used `terraform destroy` to remove all infrastructure.
  - This stopped and deleted the container.
  - Verified that no Docker containers or volumes remained.
- Used `terraform state list` to inspect the Terraform-managed resources before and after destruction.

## 🧾 Summary of What Was Done

| Task | Status |
|------|--------|
| EC2 setup and software installation | ✅ Done |
| Dockerfile and custom image build | ✅ Done |
| Terraform provider and config setup | ✅ Done |
| Used volume and env variables in container | ✅ Done |
| Ran `init`, `plan`, `apply`, and `destroy` commands | ✅ Done |
| Verified app in browser and via Docker CLI | ✅ Done |
| No Docker Hub or external automation used | ✅ As requested |

## 📌 Notes

- All provisioning and execution were performed **manually** via the terminal inside the EC2 instance.
- The Docker container is **fully managed by Terraform**, ensuring repeatable and clean deployments.
- No CI/CD automation or Docker image uploads to external registries were performed for this task.

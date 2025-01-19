# First CI/CD with Terraform

This repository demonstrates a CI/CD pipeline using GitHub Actions to deploy infrastructure and applications on AWS using Terraform. The workflow automates the provisioning of resources and deployment of a Dockerized application to an EC2 instance.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Workflow Overview](#workflow-overview)
- [Setup](#setup)
- [Usage](#usage)

## Prerequisites

Before you begin, ensure you have the following:

- An AWS account with appropriate permissions to create resources.
- A GitHub repository with GitHub Actions enabled.
- Terraform installed locally (for local testing).
- Docker installed locally (for local testing).

## Workflow Overview

The CI/CD pipeline consists of two main jobs:

1. **deploy-infra**: This job provisions the necessary infrastructure using Terraform.
2. **deploy-app**: This job builds a Docker image, pushes it to Amazon ECR. 

### Key Steps in the Workflow

- **Terraform Init**: Initializes Terraform and configures the backend for state management.
- **Terraform Plan**: Creates an execution plan for the infrastructure changes.
- **Terraform Apply**: Applies the changes required to reach the desired state of the configuration.
- **Docker Build and Push**: Builds the Docker image and pushes it to Amazon ECR.
- **Deploy to EC2**: Connects to the EC2 instance via SSH and runs the Docker container.

## Setup

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/MOHyari/First-CICD.git
   cd First-CICD

2. Configure AWS Credentials: Set up the following secrets in your GitHub repository:
AWS_ACCESS_KEY_ID: Your AWS access key ID.
AWS_SECRET_ACCESS_KEY: Your AWS secret access key.
AWS_TF_STATE_BUCKET_NAME: The name of the S3 bucket for Terraform state.
AWS_REGION: The AWS region where resources will be deployed.
AWS_SSH_KEY_PRIVATE: Your private SSH key for accessing the EC2 instance.
AWS_SSH_KEY_PUBLIC: Your public SSH key (optional, for reference).
Terraform Configuration: Ensure your Terraform configuration files are located in the ./terraform directory. The configuration should include the necessary resources and outputs, such as the public IP of the EC2 instance.
Dockerfile: Place your Dockerfile in the root of the repository or specify the path in the workflow if it's located elsewhere.
Usage

Push Changes: Whenever you push changes to the main branch, the CI/CD pipeline will automatically trigger, provisioning the infrastructure and deploying the application.
Monitor Actions: You can monitor the progress of the workflow in the "Actions" tab of your GitHub repository.

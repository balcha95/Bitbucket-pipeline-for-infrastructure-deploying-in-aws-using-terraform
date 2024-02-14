# Bitbucket-pipeline-for-infrastructure-deploying-in-aws-using-terraform
Bitbucket pipeline for infrastructure deploying in aws using terraform

This repository contains a Bitbucket Pipeline configuration for deploying infrastructure in AWS using Terraform. Below are the steps to set up and use this pipeline.

**Prerequisites:**
- An AWS account with appropriate permissions to create and manage resources.
- Terraform installed and configured locally.
- A Bitbucket repository containing your Terraform configuration files.

**Setting up Bitbucket Pipeline:**

**Step 1: Configure AWS Credentials:**
Before deploying infrastructure to AWS using Bitbucket Pipelines, configure AWS credentials securely.

1. In your Bitbucket repository, go to **Settings > Repository settings > Repository variables**.
2. Add the following repository variables:
   - `AWS_ACCESS_KEY_ID`: Your AWS access key ID.
   - `AWS_SECRET_ACCESS_KEY`: Your AWS secret access key.
   - Optionally, you can also add `AWS_DEFAULT_REGION` to specify the default AWS region.

**Step 2: Define Bitbucket Pipeline:**
Define the Bitbucket Pipeline configuration in your repository.

1. Create a `bitbucket-pipelines.yml` file in the root of your repository.
2. Define the pipeline steps in the `bitbucket-pipelines.yml` file. Here's an example configuration:

```yaml
image: hashicorp/terraform:latest

pipelines:
  branches:
    master:
      - step:
          name: Deploy to AWS
          deployment: production
          script:
            - terraform init
            - terraform plan -out=tfplan
            - terraform apply -auto-approve
```

This configuration runs on the `master` branch, initializes Terraform, creates an execution plan, and applies changes automatically.

**Step 3: Triggering the Pipeline:**
Push changes to the `master` branch to trigger the pipeline.

**Step 4: Monitoring Deployment:**
Monitor pipeline execution in the Bitbucket Pipelines interface. Logs and output of each step help troubleshoot any issues.

**Conclusion:**
Bitbucket Pipelines simplifies infrastructure deployment in AWS using Terraform. This README provides a guide to set up and use the pipeline efficiently.

**References:**
- [Bitbucket Pipelines Documentation](https://support.atlassian.com/bitbucket-cloud/docs/get-started-with-bitbucket-pipelines/)
- [Terraform Documentation](https://learn.hashicorp.com/tutorials/terraform/install-cli)

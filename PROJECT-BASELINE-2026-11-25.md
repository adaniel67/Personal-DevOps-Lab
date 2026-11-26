# Personal-DevOps-Lab — Project Baseline

**Baseline date:** November 25, 2026  
**Repository:** https://github.com/adaniel67/Personal-DevOps-Lab  
**AWS Region:** `us-east-2`  
**Environment:** Windows 11, Visual Studio Code, PowerShell, Terraform, AWS CLI, GitHub Actions

---

## 1. Project Purpose

Personal-DevOps-Lab is a hands-on AWS CloudOps and DevOps portfolio project demonstrating:

- Infrastructure provisioning using Terraform
- AWS infrastructure operation and management
- IAM security and least-privilege access
- Systems Manager access without SSH
- PowerShell and AWS CLI automation
- CI/CD validation using GitHub Actions
- Infrastructure documentation, monitoring, troubleshooting, and cost control

The project preserves the existing AWS infrastructure and builds upon it incrementally.

## 2. Environment and Tools

| Component | Configuration |
|---|---|
| Operating system | Windows 11 |
| Editor | Visual Studio Code |
| Shell | PowerShell |
| Cloud provider | Amazon Web Services |
| AWS region | `us-east-2` |
| Infrastructure as Code | Terraform |
| Cloud CLI | AWS CLI |
| Version control | Git |
| Source repository | GitHub |
| CI/CD | GitHub Actions |
| Instance access | AWS Systems Manager Session Manager |

## 3. Existing AWS Infrastructure

The following infrastructure work has been completed and deployed:

- AWS account and IAM user configured.
- Terraform installed and initialized.
- AWS provider configured.
- VPC created and deployed.
- Subnet configuration created and deployed.
- Internet Gateway configured.
- Public routing configured.
- Security group created.
- EC2 instance deployed.

### EC2 instance

| Property | Recorded value |
|---|---|
| Instance ID | `i-01dfe8c2aafde46d4` |
| AWS region | `us-east-2` |
| Last recorded status | Stopped |

The stopped status is the last recorded checkpoint, not a fresh status check performed on the baseline date.

### Private networking

Private subnet and route-table configuration has been part of the subsequent Terraform work.

A private route table and subnet association were reported as present in the local configuration during the November 25 checkpoint. Their final saved configuration, deployment status, and successful GitHub push were not all confirmed at that checkpoint.

A NAT Gateway or default internet route for the private subnet has not been established as completed work in this baseline.

## 4. Instance Access and Operations

### Systems Manager Session Manager

- Access to the EC2 instance through Systems Manager Session Manager was successfully tested.
- SSH is not used.
- Port 22 is not required and must not be opened for this project.
- The instance role and instance profile were verified.
- The instance role has the `AmazonSSMManagedInstanceCore` policy.

### PowerShell and AWS CLI

PowerShell commands using the AWS CLI to start and stop the EC2 instance were successfully tested.

This is the established operational approach for demonstrating instance management.

The instance should be stopped when it is not needed for testing.

### IAM permissions

An IAM policy named `Personal-DevOps-Lab-Terraform-Permissions` was configured to scope EC2 start, stop, and terminate permissions to resources tagged with:

`Environment=Lab`

Start and stop permissions were tested successfully.

An outstanding permission issue was identified:

- IAM user `terraform-lab` received `AccessDenied` for `ssm:DescribeInstanceInformation`.
- This is separate from the EC2 instance-role configuration.
- The additional IAM-user permission requirement remains an item for review.

The `ec2:RunInstances` wildcard permission in the Terraform IAM policy also remains subject to security review.

## 5. Terraform and CI/CD

### Terraform

The following work has been completed:

- Terraform configuration created.
- Terraform initialized.
- Terraform formatting checked.
- Terraform validation completed.
- Infrastructure deployed.
- Terraform plan tested.

The latest recorded Terraform plan showed no changes at the November 23–24 checkpoint.

This does not establish that every subsequent local configuration change has been validated or deployed.

### GitHub Actions

The GitHub Actions workflow successfully completed:

- Terraform format check
- Terraform initialization
- Terraform validation

The Terraform plan workflow was also tested.

The latest recorded plan showed no infrastructure changes.

## 6. Repository and Version Control

**GitHub repository:**

https://github.com/adaniel67/Personal-DevOps-Lab

The repository uses Git for version control and GitHub for remote storage and CI/CD integration.

The README documentation exists in the repository.

The following additional documentation files were intended deliverables but had not been created as of November 26, 2026:

- `PROJECT-BASELINE-2026-11-25.md`
- `PROJECT-ROADMAP.md`
- `PROJECT-OPERATIONS.md`

These documents are to be created without replacing or restructuring existing repository files.

## 7. Security Considerations

Established security decisions:

- Use Systems Manager Session Manager instead of SSH.
- Do not open inbound port 22.
- Scope EC2 permissions to tagged lab resources where supported.
- Review IAM permissions for unnecessary wildcard access.
- Review security group outbound rules.
- Preserve existing infrastructure and security configuration unless a specific change is approved.

Outstanding reviews:

1. Review `ec2:RunInstances` wildcard permissions.
2. Review security group outbound access requirements.
3. Determine whether the IAM user needs `ssm:DescribeInstanceInformation`.
4. Confirm the final private subnet and route-table configuration.

## 8. Cost Management

Cost control is a critical project requirement.

- Remain on the existing AWS Free Plan.
- Do not recommend upgrading to a paid plan.
- Verify applicable Free Plan benefits before proposing new AWS resources or services.
- Do not assume AWS credits make a resource free.
- Stop the EC2 instance when it is not needed.
- Avoid unnecessary running resources and paid services.
- Explain potential costs before any proposed AWS deployment or modification.

No AWS resource may be created, modified, or destroyed without explicit user approval.

Terraform `apply` and `destroy` must never be run without that approval.

## 9. Project Boundaries

This repository remains focused on AWS, Terraform, and CloudOps/DevOps infrastructure.

Related learning projects remain separate:

- `Linux-Practice-Lab` — Linux administration and practice.
- `Docker-Kubernetes-Lab` — Docker and Kubernetes.

These repositories may integrate conceptually or operationally in the future, but their work must remain separate.

## 10. Outstanding Work at Baseline

The following items remain open or require verification:

- Complete and maintain the three project documentation files.
- Review IAM wildcard permissions.
- Review security group egress rules.
- Resolve or document the IAM user's `ssm:DescribeInstanceInformation` permission issue.
- Confirm the final private route-table configuration and subnet association.
- Confirm whether the latest private networking changes were validated, planned, and pushed.
- Continue improving CI/CD while preserving the existing working workflow.
- Continue documenting operational procedures and troubleshooting.

## 11. Change-Control Rules

The following rules govern future project work:

1. Preserve all existing infrastructure and repository work.
2. Do not recreate completed resources or repeat completed exercises unnecessarily.
3. Work in small, verified steps.
4. Provide exact commands, filenames, and locations.
5. Wait for the user's output before proceeding to the next step.
6. Never assume a command succeeded without seeing its result.
7. Explain potential AWS costs before proposing infrastructure changes.
8. Never execute Terraform apply, destroy, or AWS resource modifications without explicit approval.
9. Keep the EC2 instance stopped when it is not required.
10. Record verified results in project documentation and the roadmap.

---

**Baseline status:** Historical project baseline assembled from recorded project checkpoints through November 25, 2026. Items explicitly marked unverified require confirmation before being treated as completed.
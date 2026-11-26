# Personal-DevOps-Lab — Operations Guide

**Last updated:** November 26, 2026  
**Repository:** https://github.com/adaniel67/Personal-DevOps-Lab  
**AWS Region:** `us-east-2`

## 1. Purpose

This document provides operational procedures for managing, verifying, maintaining, and troubleshooting the existing Personal-DevOps-Lab AWS infrastructure.

All procedures must preserve existing infrastructure, maintain security, and minimize AWS costs.

## 2. Local Working Environment

| Component | Configuration |
|---|---|
| Operating system | Windows 11 |
| Editor | Visual Studio Code |
| Command shell | PowerShell |
| Repository root | `C:\Users\Admin\Personal-DevOps-Lab` |
| Terraform directory | `C:\Users\Admin\Personal-DevOps-Lab\terraform` |
| Git branch | `master` |
| Git remote | `origin` |
| AWS region | `us-east-2` |
| Infrastructure management | Terraform |
| CI/CD | GitHub Actions |
| EC2 access | AWS Systems Manager Session Manager |

Unless otherwise specified, AWS CLI, Git, and Terraform commands are executed in the VS Code PowerShell terminal.

Linux commands are executed inside the EC2 instance through Systems Manager Session Manager.

## 3. EC2 Instance Information

| Property | Value |
|---|---|
| Instance ID | `i-01dfe8c2aafde46d4` |
| Region | `us-east-2` |
| Last recorded state | Stopped |
| Remote access | Systems Manager Session Manager |
| SSH access | Not used |

The recorded instance state is historical. Use the status command below when a current state is required.

## 4. Verify AWS CLI Identity

**PowerShell:**

```powershell
aws sts get-caller-identity
```

Purpose:

- Confirm that AWS CLI credentials are functioning.
- Identify the AWS account and authenticated IAM identity.
- Detect credential or authentication problems.

This command does not modify AWS resources.

Do not publish AWS account identifiers, credentials, access keys, or session tokens in public documentation or screenshots.

## 5. EC2 Status and Lifecycle Management

The following procedures use the existing Terraform-managed EC2 instance.

### 5.1 Check Instance Status

**PowerShell:**

```powershell
aws ec2 describe-instances --instance-ids i-01dfe8c2aafde46d4 --region us-east-2 --query "Reservations[0].Instances[0].State.Name" --output text
```

Possible results:

- `pending` — Instance is starting.
- `running` — Instance is running.
- `stopping` — Instance is shutting down.
- `stopped` — Instance is stopped.
- `shutting-down` — Instance is being terminated.
- `terminated` — Instance has been terminated.

This is a read-only operation.

### 5.2 Start the EC2 Instance

Start the instance only when required for an approved exercise.

**PowerShell:**

```powershell
aws ec2 start-instances --instance-ids i-01dfe8c2aafde46d4 --region us-east-2
```

Wait for the instance to reach the running state:

```powershell
aws ec2 wait instance-running --instance-ids i-01dfe8c2aafde46d4 --region us-east-2
```

Verify the instance status using the command in Section 5.1.

Expected result:

```text
running
```

The waiter normally produces no output when successful.

Starting the instance consumes AWS resources and may consume available Free Plan credits.

### 5.3 Stop the EC2 Instance

Stop the instance when testing is complete.

**PowerShell:**

```powershell
aws ec2 stop-instances --instance-ids i-01dfe8c2aafde46d4 --region us-east-2
```

Wait for the instance to stop:

```powershell
aws ec2 wait instance-stopped --instance-ids i-01dfe8c2aafde46d4 --region us-east-2
```

Verify the instance status using the command in Section 5.1.

Expected result:

```text
stopped
```

Stopping the instance does not terminate it or remove its Terraform configuration.

Associated resources, including EBS storage, may continue consuming AWS credits while the instance is stopped.

### 5.4 Termination Restrictions

Do not terminate the EC2 instance through the AWS CLI or AWS Console as part of normal operations.

Do not run Terraform destroy without explicit approval.

Infrastructure lifecycle changes must be reviewed and managed through Terraform.

## 6. Systems Manager Session Manager

Systems Manager Session Manager is the established method for accessing the EC2 instance.

SSH is not used, and inbound port 22 must remain closed.

### 6.1 Connection Procedure

1. Start the EC2 instance using PowerShell when access is required.
2. Verify that the instance reaches the running state.
3. Sign in to the AWS Management Console.
4. Select the Ohio region (`us-east-2`).
5. Navigate to EC2.
6. Select Instances.
7. Select instance `i-01dfe8c2aafde46d4`.
8. Select Connect.
9. Select the Session Manager tab.
10. Select Connect.

A browser-based Linux shell should open once the instance is available through Systems Manager.

The instance may require additional time after reaching the running state before Systems Manager connectivity becomes available.

### 6.2 Verify Linux Connectivity

The following commands are executed inside the EC2 Linux shell, not in PowerShell.

```bash
whoami
```

```bash
hostname
```

```bash
cat /etc/os-release
```

Verify outbound HTTPS connectivity:

```bash
curl -I https://aws.amazon.com
```

An HTTP response confirms that the instance can communicate with the destination over HTTPS.

Outbound HTTPS connectivity was successfully tested during earlier project work.

### 6.3 End the Session

Inside the Linux shell:

```bash
exit
```

Close the Session Manager browser session.

Return to PowerShell and stop the instance if no additional testing is required.

## 7. Terraform Verification Procedures

Terraform commands must be executed from the Terraform directory.

**PowerShell:**

```powershell
Set-Location C:\Users\Admin\Personal-DevOps-Lab\terraform
```

### 7.1 Check Terraform Version

```powershell
terraform version
```

Displays the installed Terraform version.

### 7.2 Check Terraform Formatting

```powershell
terraform fmt -check -recursive
```

Checks Terraform formatting without modifying configuration files.

If formatting corrections are required, review them before running `terraform fmt`.

### 7.3 Initialize Terraform

```powershell
terraform init
```

Initializes the working directory and required providers.

Initialization may update local Terraform metadata or dependency lock information. Review any resulting Git changes.

### 7.4 Validate Terraform Configuration

```powershell
terraform validate
```

Checks the syntax and internal consistency of the Terraform configuration.

Expected successful result:

```text
Success! The configuration is valid.
```

### 7.5 Generate a Terraform Plan

```powershell
terraform plan
```

Compares the Terraform configuration and state with the existing AWS infrastructure.

Review the entire plan before approving any infrastructure changes.

A previously verified no-change result was:

```text
No changes. Your infrastructure matches the configuration.
```

Terraform plan does not apply infrastructure changes.

However, it can make AWS API requests to refresh resource information.

### 7.6 Terraform Apply Restrictions

Never execute Terraform apply automatically.

Before approving an apply operation:

1. Review the complete Terraform plan.
2. Identify resources to be created, modified, replaced, or destroyed.
3. Review security implications.
4. Verify applicable AWS Free Plan benefits and potential costs.
5. Obtain explicit approval.

## 8. Git and GitHub Operations

Execute these commands from the repository root.

**PowerShell:**

```powershell
Set-Location C:\Users\Admin\Personal-DevOps-Lab
```

### 8.1 Check Repository Status

```powershell
git status
```

Displays the current branch and working-tree status.

### 8.2 Check Changes

```powershell
git diff
```

Displays unstaged changes to tracked files.

To review staged changes:

```powershell
git diff --cached
```

New untracked files are not included in the standard Git diff until staged.

### 8.3 Review Commit History

```powershell
git log --oneline -10
```

Displays the ten most recent commits.

### 8.4 Stage and Commit Changes

Stage only the specific files intended for publication.

Example:

```powershell
git add PROJECT-OPERATIONS.md
```

Review the staged changes:

```powershell
git diff --cached
```

Commit the reviewed changes:

```powershell
git commit -m "Add project operations documentation"
```

### 8.5 Push Changes to GitHub

```powershell
git push origin master
```

After pushing, verify that the intended changes appear in the GitHub repository.

### 8.6 Sensitive File Protection

Never commit:

- AWS access keys or secret access keys.
- AWS session tokens.
- Terraform state files or state backups.
- Saved Terraform plan files containing sensitive information.
- Terraform variable files containing secrets.
- Local Terraform provider binaries and cache directories.
- Private keys or other authentication credentials.

Review the repository's `.gitignore` and staged changes before committing.

## 9. GitHub Actions

GitHub Actions is the established CI/CD platform for this repository.

Previously successful workflow operations include:

- Terraform formatting checks.
- Terraform initialization.
- Terraform validation.
- Terraform planning.

### Verify Workflow Results

1. Open the Personal-DevOps-Lab repository on GitHub.
2. Select the Actions tab.
3. Select the relevant workflow run.
4. Review the job results.
5. Investigate any failed steps before proceeding.

Do not assume a workflow passed merely because a Git push succeeded.

Infrastructure deployment must not be automated without explicit approval and appropriate safeguards.

## 10. Troubleshooting

### 10.1 AWS CLI AccessDenied

Possible causes include:

- Missing IAM permissions.
- Resource-tag restrictions.
- Incorrect AWS credentials.
- Incorrect AWS region.
- An explicit deny in an applicable IAM policy.

Verify the authenticated identity:

```powershell
aws sts get-caller-identity
```

Review the failed API operation and applicable IAM permissions.

Do not resolve permission problems by granting unrestricted administrator access.

### 10.2 Systems Manager Connection Unavailable

Check the following:

1. EC2 instance is running.
2. Correct AWS region is selected.
3. Sufficient time has elapsed for the instance and SSM Agent to initialize.
4. The EC2 instance has the correct IAM instance profile.
5. The instance role has `AmazonSSMManagedInstanceCore`.
6. Required outbound HTTPS connectivity is available.
7. The connecting IAM identity has the required Session Manager permissions.

Do not open SSH port 22 as a workaround.

### 10.3 Known Systems Manager Permission Issue

The IAM user `terraform-lab` previously received AccessDenied for:

```text
ssm:DescribeInstanceInformation
```

This permission issue is separate from the EC2 instance role.

The EC2 instance role and its Systems Manager policy were previously verified.

Review the IAM user's permission requirements before making changes.

### 10.4 Unexpected Terraform Changes

If Terraform proposes unexpected changes:

1. Do not apply the plan.
2. Review the Terraform configuration.
3. Review recent Git changes.
4. Identify the reason for the proposed changes.
5. Review potential replacement, destruction, security, and cost implications.
6. Obtain approval before making corrective infrastructure changes.

### 10.5 GitHub Actions Failure

1. Open the failed workflow run.
2. Identify the failed job and step.
3. Review the error output.
4. Reproduce the relevant validation locally when appropriate.
5. Correct only the identified problem.
6. Commit and push the reviewed correction.
7. Verify the subsequent workflow result.

## 11. AWS Cost Management

The project operates under the existing AWS Free Plan.

Operational requirements:

- Do not upgrade to a paid plan.
- Verify Free Plan eligibility before introducing resources or services.
- Review AWS billing and available credits periodically.
- Start the EC2 instance only when required.
- Stop the EC2 instance after testing.
- Avoid unnecessary storage, networking, and monitoring resources.
- Do not deploy a NAT Gateway without reviewing costs and obtaining explicit approval.
- Do not assume that stopping an EC2 instance eliminates all associated resource usage.

AWS credits and applicable Free Plan benefits must be distinguished from standard AWS resource pricing.

## 12. End-of-Session Checklist

- [ ] Complete the current approved exercise.
- [ ] Close active Systems Manager sessions.
- [ ] Stop the EC2 instance if it is no longer required.
- [ ] Verify the instance is stopped when applicable.
- [ ] Save modified local files.
- [ ] Review Git status.
- [ ] Review and commit approved changes.
- [ ] Push approved commits to GitHub.
- [ ] Verify applicable GitHub Actions results.
- [ ] Update the project roadmap and checkpoint.
- [ ] Record unresolved issues and the exact next step.

## 13. Related Documentation

- [Project Baseline](PROJECT-BASELINE-2026-11-25.md)
- [Project Roadmap](PROJECT-ROADMAP.md)
- [Project README](README.md)

## 14. Document Maintenance

Update this operations guide whenever verified operational procedures, infrastructure configuration, security requirements, or troubleshooting findings change.

Distinguish previously tested procedures from newly documented procedures that have not yet been individually tested.

Preserve existing working configurations and obtain approval before making infrastructure changes.
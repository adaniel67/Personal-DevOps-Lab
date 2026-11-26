# Personal-DevOps-Lab — Project Roadmap

**Repository:** https://github.com/adaniel67/Personal-DevOps-Lab  
**AWS Region:** `us-east-2`  
**Last updated:** November 26, 2026

## Project Objective

Build a professional, hands-on AWS CloudOps/DevOps portfolio demonstrating infrastructure as code, cloud operations, automation, security, CI/CD, monitoring, troubleshooting, and technical documentation.

Preserve the existing infrastructure and repository. All future work must build incrementally on verified results.

## Phase 1 — AWS Infrastructure Foundation

**Status: Completed, with subsequent networking changes requiring verification.**

- [x] Configure AWS account and IAM user.
- [x] Install and initialize Terraform.
- [x] Configure AWS provider.
- [x] Create and deploy VPC.
- [x] Create and deploy subnet configuration.
- [x] Configure Internet Gateway.
- [x] Configure public routing.
- [x] Create security group.
- [x] Deploy EC2 instance.
- [x] Validate Terraform configuration.
- [x] Test EC2 access through Systems Manager Session Manager.
- [x] Confirm SSH is not required.

**Existing EC2 instance:** `i-01dfe8c2aafde46d4`

**Last recorded status:** Stopped.

## Phase 2 — Cloud Operations and Automation

**Status: Core operations completed.**

- [x] Use PowerShell and AWS CLI to start the EC2 instance.
- [x] Use PowerShell and AWS CLI to stop the EC2 instance.
- [x] Test the start/stop permissions.
- [x] Establish the practice of stopping the instance when it is not needed.

**Remaining work:**

- [ ] Complete operational documentation.
- [ ] Document troubleshooting procedures.
- [ ] Document operational verification and expected command results.

## Phase 3 — IAM and Security

**Status: Partially completed; reviews outstanding.**

Completed:

- [x] Configure IAM permissions for Terraform operations.
- [x] Scope EC2 start, stop, and terminate permissions to resources tagged `Environment=Lab`.
- [x] Verify the EC2 instance role and instance profile.
- [x] Confirm `AmazonSSMManagedInstanceCore` is attached to the instance role.
- [x] Test EC2 start/stop permissions.

Outstanding:

- [ ] Review `ec2:RunInstances` wildcard permission.
- [ ] Review security group outbound rules.
- [ ] Investigate the IAM user's `ssm:DescribeInstanceInformation` AccessDenied result.
- [ ] Document the distinction between the IAM user's permissions and the EC2 instance role.

No security or IAM changes should be made without reviewing their impact first.

## Phase 4 — Private Networking

**Status: Completed and verified November 26, 2026.**

- [x] Public networking foundation deployed.
- [x] Verify private subnet configuration in the saved Terraform files.
- [x] Verify private route table configuration.
- [x] Verify private subnet route-table association.
- [x] Confirm private networking resources exist in Terraform state.
- [x] Verify deployed private networking resources through Terraform plan.
- [x] Confirm Terraform plan reports no changes.
- [x] Confirm remote Terraform configuration matches the verified local configuration.

### Verified AWS Resources

| Resource | AWS ID |
|---|---|
| Private subnet | `subnet-06b3eda3aa11274d0` |
| Private route table | `rtb-099486899ca6e1192` |
| Private route table association | `rtbassoc-089994e096fed516d` |

### Verification Result

Terraform plan executed successfully on November 26, 2026:

> No changes. Your infrastructure matches the configuration.

The private subnet has a dedicated route table without a default internet route. No NAT Gateway is configured.

This architecture satisfies the current project networking and cost-control requirements.

No infrastructure modifications were required during verification.

## Phase 5 — CI/CD and Infrastructure Validation

**Status: Initial workflow completed.**

- [x] Configure GitHub Actions.
- [x] Run Terraform formatting checks.
- [x] Run Terraform initialization.
- [x] Run Terraform validation.
- [x] Test Terraform plan workflow.
- [x] Confirm a recorded plan reported no changes.

Outstanding:

- [ ] Review the existing workflow files.
- [ ] Document the CI/CD workflow.
- [ ] Identify useful improvements without disrupting the working pipeline.
- [ ] Verify future changes through GitHub Actions.

Do not introduce unnecessary CI/CD tools or services.

## Phase 6 — Monitoring and Troubleshooting

**Status: Planned.**

- [ ] Identify monitoring capabilities appropriate to the existing infrastructure.
- [ ] Evaluate AWS-native monitoring options and applicable Free Plan benefits.
- [ ] Document basic EC2 health and status checks.
- [ ] Document troubleshooting for Systems Manager connectivity.
- [ ] Document common Terraform and AWS CLI errors.
- [ ] Add monitoring only after reviewing cost and obtaining approval.

Avoid paid monitoring services unless explicitly approved.

## Phase 7 — Documentation

**Status: Initial documentation milestone completed November 26, 2026. Ongoing maintenance required.**

- [x] Create `PROJECT-BASELINE-2026-11-25.md`.
- [x] Create `PROJECT-ROADMAP.md`.
- [x] Create `PROJECT-OPERATIONS.md`.
- [x] Commit and push all three documents to GitHub.
- [x] Verify Markdown rendering on GitHub.
- [x] Verify GitHub Actions passed for commit `18839ea`.

### Ongoing Documentation

- [ ] Maintain the README as the project evolves.
- [ ] Update the roadmap after verified milestones.
- [ ] Maintain operational and troubleshooting procedures.
- [ ] Document security reviews and monitoring capabilities.
- [ ] Keep documentation consistent with deployed infrastructure.

The baseline document remains a historical snapshot. The roadmap and operations guide are living documents.

## Phase 8 — Portfolio Review

**Status: Planned.**

- [ ] Review repository organization and presentation.
- [ ] Verify Terraform configuration and documentation agree.
- [ ] Verify CI/CD results.
- [ ] Review security and cost controls.
- [ ] Document the architecture and operational workflow.
- [ ] Prepare the repository for professional portfolio presentation.

## Project Rules and Constraints

1. Preserve existing infrastructure and completed work.
2. Use Terraform for infrastructure as code.
3. Use PowerShell and AWS CLI for EC2 start/stop demonstrations.
4. Use Systems Manager Session Manager; do not introduce SSH.
5. Do not open port 22.
6. Keep Docker/Kubernetes and Linux administration in their separate repositories.
7. Remain on the existing AWS Free Plan.
8. Verify applicable Free Plan benefits and potential charges before proposing AWS resource changes.
9. Never run `terraform apply` or `terraform destroy` without explicit approval.
10. Never create, modify, or destroy AWS resources without explicit approval.
11. Stop the EC2 instance when it is not needed.
12. Work one small step at a time and verify results before proceeding.

## Current Checkpoint — November 26, 2026

### Completed and Verified

- [x] Created all three project documentation files.
- [x] Committed and pushed documentation to GitHub.
- [x] Verified documentation renders correctly on GitHub.
- [x] Verified GitHub Actions passed for commit `18839ea`.
- [x] Verified no Terraform state files appear in available Git history.
- [x] Reviewed existing `.gitignore` configuration.
- [x] Verified Terraform state, state backups, saved plan `tfplan`, and `.terraform/` ignore rules.
- [x] Verified private subnet configuration.
- [x] Verified private route table and subnet association.
- [x] Verified private networking resources in Terraform state.
- [x] Executed Terraform plan and confirmed no infrastructure changes.
- [x] Confirmed local `terraform/main.tf` matches GitHub's `origin/master`.

### Current Infrastructure Status

- AWS region: `us-east-2`
- EC2 instance: `i-01dfe8c2aafde46d4`
- Last recorded EC2 operational state: Stopped.
- Terraform state: 13 managed resources and one data source.
- Terraform plan: No changes.
- Private networking: Fully verified.
- NAT Gateway: Not configured.
- SSH: Not used.
- AWS infrastructure modifications during this session: None.

### Outstanding Work

- [ ] Review IAM `ec2:RunInstances` wildcard permissions.
- [ ] Review security group outbound access requirements.
- [ ] Review IAM user `ssm:DescribeInstanceInformation` permission issue.
- [ ] Continue CI/CD improvements.
- [ ] Develop monitoring and troubleshooting capabilities.
- [ ] Continue portfolio documentation and presentation.

### Exact Next Step

Commit and push the updated project roadmap and verify the GitHub Actions result.

Following successful publication, resume Phase 3 — IAM and Security, beginning with a read-only review of the `ec2:RunInstances` permissions.

No AWS resource modifications are authorized at this checkpoint.
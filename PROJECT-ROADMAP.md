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

**Status: Configuration reported; final verification outstanding.**

- [x] Public networking foundation deployed.
- [ ] Verify private subnet configuration in the saved Terraform files.
- [ ] Verify private route table configuration.
- [ ] Verify private subnet route-table association.
- [ ] Run Terraform formatting and validation after reviewing the configuration.
- [ ] Review Terraform plan.
- [ ] Confirm GitHub contains the intended configuration.

A NAT Gateway or private-subnet default internet route is not an established completed deliverable.

Any proposed networking deployment must first include a cost assessment. No resources may be deployed without explicit approval.

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

**Status: In progress.**

Required documents:

- [x] `PROJECT-BASELINE-2026-11-25.md` — created locally November 26, 2026; GitHub publication pending.
- [ ] `PROJECT-ROADMAP.md` — current document; save and verify locally.
- [ ] `PROJECT-OPERATIONS.md` — operational procedures; not yet created.

Also:

- [ ] Review the existing `README.md`.
- [ ] Ensure documentation accurately distinguishes completed, planned, and unverified work.
- [ ] Commit and push the approved documentation.
- [ ] Verify all three documents on GitHub.

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

**Last confirmed work:**

- Existing AWS infrastructure and CI/CD foundation completed.
- Three intended documentation files were confirmed absent from the repository and available Git history.
- `PROJECT-BASELINE-2026-11-25.md` was created locally and verified.
- The baseline file is currently untracked.
- No documentation commit or push has been performed.

**Immediate next steps:**

1. Save and verify this roadmap as `PROJECT-ROADMAP.md`.
2. Create and verify `PROJECT-OPERATIONS.md`.
3. Review all three documents.
4. Commit and push the approved documentation.
5. Verify the documents on GitHub.

**AWS infrastructure changes are not part of the current documentation workflow.**

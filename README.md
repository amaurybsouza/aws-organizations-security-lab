# ☁️ AWS Organizations Security Lab

This repository documents my hands-on learning using AWS Skill Builder, focusing on AWS Organizations and cloud governance.

---

## 🎯 Objective

Understand how to design and secure multi-account AWS environments using AWS Organizations.

---

## 🧱 Key Concepts

- Organizational Units (OUs)
- Service Control Policies (SCPs)
- Multi-account strategy
- Centralized governance

---

## 🔐 Security Approach

- Enforcing least privilege using SCPs
- Restricting regions and services
- Isolating workloads by environment (prod, dev, sandbox)

---

## 🧪 Practical Implementation

- Designed a sample multi-account architecture
- Created SCP examples to restrict actions
- Simulated governance scenarios

´´´json
# Example SCP: Deny public S3

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Action": "s3:PutBucketPublicAccessBlock",
      "Resource": "*"
    }
  ]
}
´´´

---

## 🧠 Key Learnings

- Governance must be centralized
- SCPs do not grant permissions, only restrict
- Multi-account strategy is critical for security and scale

---

## 🚀 Next Steps

- Integrate with AWS Control Tower
- Add automated compliance checks
## What problems does Organizations solve?
Organizations helps you centrally govern and manage your cloud environment by providing tools and capabilities to solve the following:

![aws-org](https://github.com/amaurybsouza/aws-organizations-security-lab/blob/main/notes/images/image.png)

- Centralization: Organizations offers centralized management of cloud environments, providing flexibility and seamless alignment with business processes.
- Governance: Organizations can secure and audit your environment by controlling access to accounts, AWS Regions, and services.
- Compliance: With Organizations, you can strengthen your security posture by enforcing policies, monitoring activities, and helping with compliance across accounts.
- Resource sharing: You can use Organizations to share resources across developer teams rapidly and securely.

## What are the benefits of Organizations?
### Provide centralized management across a multi-account environment
With Organizations, you can consolidate your current accounts under a single organization, providing centralized management. It empowers you to efficiently add, invite, or delete accounts in your organization, supporting seamless scalability with built-in central administration capabilities. Furthermore, you have the flexibility to organize your accounts into distinct organizational units (OUs) and assign unique access policies to each OU.

## AWS Organizations Architecture
The following diagram shows a basic organization that consists of seven accounts organized into four OUs under the root. The organization also has a few policies that are applied to OUs.

![aws-org-architecture](https://github.com/amaurybsouza/aws-organizations-security-lab/blob/main/notes/images/image-1.png)

- **root**: The root account is the central point of control and management for the entire organization. It is the top-level entity of the organization and defines any resources (accounts and OUs) associated with the organization.
- **Policies**: in Organizations provide granular control over actions, resources, and services, helping create a secure and well-managed AWS environment for the entire organization.


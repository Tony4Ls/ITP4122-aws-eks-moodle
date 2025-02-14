# ITP4122 - AWS EKS Moodle Deployment
Use Terraform to build the basic infrastructure required for deploying Moodle on AWS EKS.
---
## Getting Started
### Initialize Terraform
```sh
terraform init
```
### Plan Infrastructure
```sh
terraform plan
```
### Apply Changes
```sh
terraform apply --auto-approve
```
### Destroy Infrastructure
```sh
terraform destroy --auto-approve
```
---
## Tools and Add-ons Used in the Deployment
### Tools
- **kubectl**: CLI for Kubernetes
- **eksctl**: CLI for creating EKS clusters
- **helm**: Kubernetes package manager
### Add-ons
- **Amazon EBS CSI Driver**: For dynamic provisioning of EBS volumes
- **AWS Load Balancer Controller**: To manage AWS ALBs and NLBs for Kubernetes
- **Metrics Server**: For resource metrics (CPU/memory) in Kubernetes
- **Istio**: Service mesh for traffic management and security
---
## Update EKS kubeconfig
```sh
aws eks --region us-east-1 update-kubeconfig --name B07-eks-cluster
```
---
## Notes
- Don't forget to **create a MySQL database** for your Moodle deployment. This is a required step before deploying Moodle.
- Ensure that all tools and add-ons mentioned above are installed and configured properly.
---
## Useful Links
- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS EKS Documentation](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html)
- [Helm Charts](https://helm.sh/)
- [Istio Documentation](https://istio.io/latest/docs/)
---
Happy Deploying! 🚀

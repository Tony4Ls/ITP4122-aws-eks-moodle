# ITP4122-aws-eks-moodle

## Use terraform to build to basic infrastructure for deploy moodle

```sh
terraform init
```

```sh
terraform apply --auto-approve
```

Delete the infrastructure

```sh
terraform destroy --auto-approve
```

## Tools and addons use for the deployment

Tools

- kubectl

- eksctl

- helm


Addons

- Amazon EBS CSI driver

- AWS Load Balancer Controller

- Metrics-server

- Isito

## Update eks kubeconfig

```sh
aws eks --region us-east-1 update-kubeconfig --name B07-eks-cluster
```

## Default Moodle Username and Password

- Username: user
- Password: bitnami




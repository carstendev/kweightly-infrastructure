# kweightly-infrastructure
Infrastructure project to set-up all gcp resources for the kweightly project.

## Goal
The goal for this project is to demonstrate how to provision cloud infrastructure as code using terraform.

## Set-Up

The project is split into multiple parts. 

The k8s deployments are located in the k8s folder.
The terraform files to provision the gcp infrastructure are located in the tf folder.

### Provision project

Terraform uses modular setup and in order to download specific plugin for cloud provider, terraform will need to be 1st initiated.
To provision the project do the following within the project folder.

```sh
terraform init
```

### Workspace creation for dev and prod

Once we have our project code and our tfvar secretes secure we can create workspaces for terraform

> NOTE: in below example we will use only dev workspace but you can use both following same logic

* Create dev workspace

```sh
terraform workspace new dev
```

* List available workspaces

```sh
terraform workspace list
```

* Switch between workspaces

```sh
terraform workspace select dev
```

### Terraform plan

Terraform plan will simulate what changes terraform will be done on cloud provider

```sh
terraform plan
```

### Apply terraform plan for selected environment

```sh
terraform apply
```
With above code we only created new project in Google Cloud and this dependent of the in what terraform workspace we are in.

## Creating Kubernetes cluster on GKE and PostgreSQL on Cloud SQL

Once we have project ready for dev and prod we can move into deploying our gke and sql infrastructure.

Now is time to deploy our infrastructure, noticeable differences between prod and dev workspaces you can find in the terraform files.

* dev - single instance of PostgreSQL without replication and read replica
* prod - single instance in multi AZ for high availablity and additional one read replica for PostgreSQL
* dev - single kubernetes node will be added to GKE
* prod - two nodes will be created and added to kubernetes GKE

* Initialize and pull terraform cloud specific dependencies

```sh
terraform init
```

* Create dev workspace

```sh
terraform workspace new dev
```

* List available workspaces

```sh
terraform workspace list
```

* Switch between workspaces

```sh
terraform workspace select dev
```

* Terraform plan will simulate what changes terraform will be done on cloud provider

```sh
terraform plan
```

* Apply terraform

```sh
terraform apply
```

* To check what terraform deployed use

```sh
terraform show
```

* Once test is completed you can remove "destroy" all buildup infrastructure.

```sh
terraform destroy -auto-approve
```

## Terraform Tips

* Refresh terraform

```sh
terraform refresh
```

* List and show terraform state file

```sh
terraform state list
terraform state show
```

* Use tflint to check syntax of the tf files

```sh
tflint
```

* Destroy only selected module Ex.

```sh
terraform destroy -target=module.cloudsql
```

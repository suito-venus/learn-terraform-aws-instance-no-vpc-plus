# learn-terraform-aws-instance - no default vpc, S3 backend version

## refernce

https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-build

## Environment variables

|envrionment variable name | default | detail |
|----|----|----|
|TF_VAR_project-name|learn-terraform-aws-instance|Used to all resource name prefix.|
|TF_VAR_cost-tag-value|cost-responsible-dept-or-username|Tag value for "Cost"|
|TFSTATE_BUCKET| - | Terraform S3 backend for .tfstate file|
|TFSTATE_KEY| - | Terraform s3 backend S3 prefix(path).|
|TFSTATE_REGION| - | Terraform S3 backend bucket region. |

## setup

Before this procedure , you will set envrionment variables explain before.
Like below.

```bash
export TF_VAR_project_name="learn-terraform-aws-ec2-instance"
export TF_VAR_cost_tag_value="cost-responcible-username"
export TFSTATE_BUCKET="your-original-s3-bucket-name-for-tfstate-backend"
export TFSTATE_KEY="s3-file-prefix-of-tfstate-file/learn-terraform-aws-ec2-instance.tfstate"
export TFSTATE_REGION="<s3-bucket-aws-region>"
```

Run terraform init with backend setting.

```bash
terraform init \
-backend-config="bucket"="${TFSTATE_BUCKET}" \
-backend-config="key"="${TFSTATE_KEY}" \
-backend-config="region"="${TFSTATE_REGION}"
```

Then apply

```bash
terraform apply
```

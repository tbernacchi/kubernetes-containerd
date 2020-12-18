# Terraform
Terraform to provision the instances in AWS.

## Version
```bash
Terraform v0.12.19
+ provider.aws v3.21.0
```

## Usage
Set up your backend state in ```provider.tf```
see [backend](https://www.terraform.io/docs/backends/types/s3.html);

```bash
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
export AWS_DEFAULT_REGION=""
```

```bash
terraform init
terraform plan -out "plan"
terraform apply "plan"
```
## License
[MIT](https://choosealicense.com/licenses/mit/)

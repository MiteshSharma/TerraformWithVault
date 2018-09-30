# Terraform Security Using Vault

We are going to use Terraform with Vault for generating dynamic access and secret keys. Terraform has Vault provider for making calls to vault backend. Vault authentication happens using tokens. Each token is assigned to a policy that decides its action and path. We need to generate Vault token so that terraform can talk to vault for enabling AWS backend, defining roles for IAM and generating credentials. We are going to write terraform code using vault provider to access AWS vault secret backend engine for generating dynamic credentials using vault tokens.

There are going to be two parts of this: one where we are going to enable AWS vault secret engine and provide admin level AWS credentials which vault can use to dynamically generate new credentials. We need to define vault role that maps to a set of permissions in AWS as well as an AWS credential type. In another part, we fetch AWS credentials by providing a role for which credentials need to be generated. These two parts need to separate from each other as in first part we are providing admin level credentials, while the second part has no credentials. Consumers only need to know vault token and role to create their dynamic credentials.

## Steps to run this code:

Step 1: Clone this repository

Step 2: Go to admin workspace, Replace "AWS_ACCESS_KEY_HERE" with aws access key, "AWS_SECRET_KEY_HERE" with aws secret key, VAULT_ADDR with vault IP address or domain name, VAULT_TOKEN with vault token which can enable aws secret backend and create roles in it.

Step 3: In admin workspace, execute terraform from below mentioned steps. This is going to enable aws backend and create role with name "ec2-admin-role"

Step 4: Go to consumer workspace, Replace VAULT_ADDR with vault IP address or domain name, VAULT_TOKEN with vault token which can read role and get IAM access key and secret key.

Step 5: In consumer workspace, execute terraform from below mentioned steps. This is going to fetch IAM credentials from Vault and use them during creation of VPC with EC2 instance inside it.

Steps to execute any terraform code: 

Step 1: Run command "terraform init" to init configuration workspace

Step 2: Run command "terraform plan" to see output which is going to be executed.

Step 5: Run command "terraform apply" to actually create EC2 instance

Step 6: Run command "terraform destroy" to destroy created resources.
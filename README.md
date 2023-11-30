# rep-demo-env
Demo Setup for Reps

There are two separate Terraform configs here; the base config and the rep config.  

In each folder you will need to:  
`terraform init`  
`terraform apply -var="PAGERDUTY_TOKEN=TOKEN_HERE"`

This will create a `.tfstate` file for each config.  
The separated config allows you to update and change the base config without affecting the reps TF State and vice versa.  
This is useful where reps have manually changed some of the config controlled by Terraform.

<b>For the base config:</b>  
  
This should be run first.  
This will create some generic objects and some users that will be referenced as data sources in the rep config.

<b>For the rep specific config: </b>
1. copy the contents to a rep specific `.tf` file
2. replace all `repName` references with the reps initials
3. replace `rep-email` with the rep's username (assumes the user exists in the subdomain)

Example:  
  
`sed "s/repName/DXR/" ae-objects-repName.tf.txt > ae-objects-DXR.tf`
  
`sed -i '' "s/rep-email/dxr@example.com/g" ae-objects-DXR.tf`


You can either create one file per rep and manage them all in the one `.tfstate` file or create one folder per rep.  
Up to you.


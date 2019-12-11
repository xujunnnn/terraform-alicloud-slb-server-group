Alicloud Load Balancer (SLB) Server Group Terraform Module
=============================================

Terraform module which creates SLB VServerGroup(s) on Alibaba Cloud.

These types of resources are supported:

* [SLB Server Group](https://www.terraform.io/docs/providers/alicloud/r/slb_server_group.html)

----------------------

Usage
-----
You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. main.tf

```hcl
module "slb-server-group" {
  source = "terraform-alicloud-modules/slb-server-group/alicloud"

  #variables for slb server group
  slb =  "lb-bp1oo2azav0k66fezun0d"
  name = "slb-server-group"
  servers = [{
  server_ids = "i-bp1iq9x2bup1mhxskn0x,i-bp13m2ypd0lqve4f5301"
  port       = 100
  weight     = 100
  type       = "ecs"
  }]
}

```

2. Setting `region`, `access_key` and `secret_key` values through environment variables:

    - ALICLOUD_ACCESS_KEY
    - ALICLOUD_SECRET_KEY
    - ALICLOUD_REGION

3. Get up and running

* Init phase

        terraform init

* Planning phase

        terraform plan

* Apply phase

        terraform apply

* Destroy

        terraform destroy

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| slb  | The ID of the SLB instance. | string  |     | yes |
| name  | The name of the server group. | string  | terraform-alicloud-slb-server-group  | no |
| servers  | A list of ECS instances to be added. | list  |     |   yes  |

- backend server

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| server_ids  | A list of backend server ids  | string  |     | yes |
| port  | The port used by the backend server  | int  |     | yes |
| weight | Weight of the backend server | int  | 100  | no  |
| type  | Type of the backend server  | string  | ecs  | no  |
## Outputs

| Name | Description |
|------|-------------|
| this_slb_server_group_id  | slb server group id created  |
| this_slb_server_group_name  | slb server group name  |
| this_slb_server_group_servers  | slb server group backend servers  |

Authors
---------
Created and maintained by jun Xu.(@xj56, vega.xj@alibaba-inc.com)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)


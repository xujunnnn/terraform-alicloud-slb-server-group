阿里云负载均衡虚拟服务器组模块
=============================================

该模块用于创建阿里云负载均衡的虚拟服务器组：虚拟服务器组 （VServer group）是一组 ECS 实例。将虚拟服务器组和一个监听关联后，监听只会将流量转发给关联的虚拟服务器组的后端服务器，不会再将流量转发给其他后端服务器

该模块支持创建以下资源:

* [SLB Server Group](https://www.terraform.io/docs/providers/alicloud/r/slb_server_group.html)

----------------------

用例
-----
参考以下步骤使用该模块：

1. 通过如下实例将module引入您的Terraform资源文件

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

2.使用该模块前，您需要在系统中设置以下环境变量： `region`, `access_key` 和 `secret_key` :

    - ALICLOUD_ACCESS_KEY
    - ALICLOUD_SECRET_KEY
    - ALICLOUD_REGION

3. 运行代码

* 通过如下命令进行初始化:

        terraform init

* 通过如下命令预览待创建的资源：

        terraform plan

* 通过如下命令创建资源：

        terraform apply

* 通过如下命令删除资源

        terraform destroy

## 输入参数

| 变量名 | 描述信息 | 类型 | 默认值 | 是否必填 |
|------|-------------|:----:|:-----:|:-----:|
| slb  | 待创建的虚拟服务器组所属的负载均衡实例id. | string  |  无   | 否 |
| name  | 待创建的虚拟服务器组的名称. | string  | terraform-alicloud-slb-server-group  | 否 |
| servers  | 需要添加到该服务器组的后端服务器列表（其属性在后端服务器属性中列出） | list  |  无   |   是  |

- 后端服务器属性

| 变量名 | 描述信息 | 类型 | 默认值 | 是否必填 |
|------|-------------|:----:|:-----:|:-----:|
| server_ids  | 需要添加的后端服务器id,支持传入逗号分隔的列表（例:"i-bp1iq9x2bup1mhxskn0x,i-bp13m2ypd0lqve4f5301"  | string  |  无  | 是 |
| port  | 流量转发到后端服务器的指定端口号  | int  |  无  | 是 |
| weight | 后端权重 | int  | 100  | 否  |
| type  | 后端服务器的类型，可选值为ecs,eni | string  | ecs  | 否  |
## 输出参数

| 变量名 | 描述信息 |
|------|-------------|
| this_slb_server_group_id  | 创建的虚拟服务器组的id  |
| this_slb_server_group_name  | 创建的虚拟服务器组的名称  |
| this_slb_server_group_servers  | 虚拟服务器组中包含的虚拟服务器  |

作者信息
---------
该脚本由 jun Xu 创建维护，详细信息可邮件联系(@xj56, vega.xj@alibaba-inc.com)

参考链接
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)


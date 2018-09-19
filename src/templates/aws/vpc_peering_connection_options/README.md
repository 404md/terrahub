# aws_vpc_peering_connection_options

Provides a resource to manage VPC peering connection options.

NOTE on VPC Peering Connections and VPC Peering Connection Options: Terraform provides both a standalone VPC Peering Connection Options and a VPC Peering Connection resource with accepter and requester attributes. Do not manage options for the same VPC peering connection in both a VPC Peering Connection resource and a VPC Peering Connection Options resource. Doing so will cause a conflict of options and will overwrite the options. Using a VPC Peering Connection Options resource decouples management of the connection options from management of the VPC Peering Connection and allows options to be set correctly in cross-account scenarios.

## input variables

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
|account_id|The id of AWS account.|string||Yes|
|region|This is the AWS region.|string|us-east-1|Yes|
|vpc_peering_connection_options_connection_id|The ID of the requester VPC peering connection.|string||Yes|
|vpc_peering_accepter_allow_remote_vpc_dns_resolution|Allow a local VPC to resolve public DNS hostnames to private IP addresses when queried from instances in the peer VPC.|boolean|true|No|
|vpc_peering_accepter_allow_vpc_to_remote_classic_link|Allow a local VPC to communicate with a linked EC2-Classic instance in a peer VPC. This enables an outbound communication from the local VPC to the remote ClassicLink connection.|boolean|true|No|
|vpc_peering_accepter_allow_classic_link_to_remote_vpc|Allow a local linked EC2-Classic instance to communicate with instances in a peer VPC. This enables an outbound communication from the local ClassicLink connection to the remote VPC.|boolean|true|No|
|vpc_peering_requester_allow_remote_vpc_dns_resolution|Allow a local VPC to resolve public DNS hostnames to private IP addresses when queried from instances in the peer VPC.|boolean|true|No|
|vpc_peering_requester_allow_vpc_to_remote_classic_link|Allow a local VPC to communicate with a linked EC2-Classic instance in a peer VPC. This enables an outbound communication from the local VPC to the remote ClassicLink connection.|boolean|true|No|
|vpc_peering_requester_allow_classic_link_to_remote_vpc|Allow a local linked EC2-Classic instance to communicate with instances in a peer VPC. This enables an outbound communication from the local ClassicLink connection to the remote VPC.|boolean|true|No|
|custom_tags|Custom tags.|map||No|
|default_tags|Default tags.|map|{"ThubName"= "{{ name }}","ThubCode"= "{{ code }}","ThubEnv"= "default","Description" = "Managed by TerraHub"}|No|

## output parameters

| Name | Description | Type |
|------|-------------|:----:|
|id|The ID of the VPC Peering Connection Options.|string|
|thub_id|The ID of the VPC Peering Connection Options (hotfix for issue hashicorp/terraform#[7982]).|string|
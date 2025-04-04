Region: geographical area where AWS has data centers.
Availability Zone: data center in region, isolated from other AZs. (Region has multiple AZs)
Edge Location: data center that caches content for faster delivery to users.
VPC: virtual private cloud, virtual network in Region.
Subnet: Smaller network within VPC, instances are launched in subnet.
(1 AZ can have multiple subnets, 1 subnet can only be in 1 AZ)
CIDR: Classless Inter-Domain Routing, IP address range, e.g. 10.0.0.0/16 (total 65,536 IP addresses) / 10.0.0.0/28 (total 16 IP addresses)
Instance: Elastic Compute Cloud (EC2), actual server. use to run virtual machine.
Elastic IP: static IP address, (when you restart your instance the new IP allocates to instance and you need to update IP in everywhere you using this instance, to avoid this use Elastic IP)
Route Table: A Route Table contains a set of rules, called routes, that are used to determine where network traffic is directed. Each subnet in your VPC must be associated with a Route Table, which controls the routing for that subnet.
Internet Gateway: allow instances to access internet.
Security Group: use to control traffic in and out of instance, works at instance level.
ACL: use to control traffic in and out of subnet, works at subnet level. (same as firewall)
NAT Gateway: use to allow instances in private subnet to access internet. (instance will be private but can access internet to download updates)
VPC peering: use to connect two VPCs in different region. use to share/sync resources between VPCs
VPC Endpoint: use to connect VPC to AWS services without internet gateway. (e.g. S3, DynamoDB)
Bastion Host: a special purpose instance that allows secure access to instances in private subnets. (use to access private instances by jumping from public instance but private instance cannot be accessed directly from internet)
VPC Flow Logs: use to capture information about the IP traffic going to and from network interfaces in your VPC.
AWS VPN: Managed VPN service, use to connect VPC to on-premises network.
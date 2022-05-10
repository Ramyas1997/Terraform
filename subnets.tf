VPC
resource "aws_vpc" "myvpc" {
  
cidr_block           = "10.0.0.0/16"
  
instance_tenancy     = "default"
  
enable_dns_support   = "true"
  
enable_dns_hostnames = "true"
  
enable_classiclink   = "false"
  
tags = {
    
Name = "myvpc"
  
}


}




resource "aws_subnet" "myvpc-public-A" {
  
vpc_id                  = aws_vpc.myvpc.id
  
cidr_block              = "10.0.1.0/24"
  
map_public_ip_on_launch = "true"
  
availability_zone       = "ap-southeast-1a"

  
tags = {
    
Name = "myvpc-public-A"
  
}

}


resource "aws_subnet" "myvpc-public-B" {
  
vpc_id                  = aws_vpc.myvpc.id
  
cidr_block              = "10.0.2.0/24"
  
map_public_ip_on_launch = "true"
  
availability_zone       = "ap-southeast-1b"

  
tags = {
    
Name = "myvpc-public-B"
  

}


}

resource "aws_subnet" "myvpc-private-A" 
{
  vpc_id                  = aws_vpc.myvpc.id
  
cidr_block              = "10.0.3.0/24"
  
map_public_ip_on_launch = "false"
  
availability_zone       = "ap-southeast-1a"

  
tags = {
    Name = "myvpc-private-A"
  

}


}


resource "aws_subnet" "myvpc-private-B" 
{
  
vpc_id                  = aws_vpc.myvpc.id
  
cidr_block              = "10.0.4.0/24"
  
map_public_ip_on_launch = "false"
  
availability_zone       = "ap-southeast-1b"

  
tags = {
    
Name = "myvpc-private-B"
  
}

}



resource "aws_internet_gateway" "myvpc-igw" 
{
  
vpc_id = aws_vpc.myvpc.id

  
tags = {

Name = "myvpc-igw"
  
}

}




resource "aws_route_table" "myvpc-public" 
{
 
vpc_id = aws_vpc.myvpc.id
  
route {
    
cidr_block = "0.0.0.0/0"
    
gateway_id = aws_internet_gateway.myvpc-igw.id
  
}

  
tags = {

Name = "myvpc-public-A"
  
}

}



resource "aws_route_table_association" "myvpc-public-1-a" {

 subnet_id      = aws_subnet.myvpc-public-1.id
  
route_table_id = aws_route_table.myvpc-public.id

}


resource "aws_route_table_association" "myvpc-public-2-a" 
{
  
subnet_id      = aws_subnet.myvpc-public-2.id
  
route_table_id = aws_route_table.myvpc-public.id
}


resource "aws_security_group" "websecurity" {
    name                = "websecurity"
    vpc_id              = aws_vpc.My-Infra.id
    description         = "Created by terraform"
    ingress {
        from_port       = local.ssh_port
        to_port         = local.ssh_port
        protocol        = local.tcp
        cidr_blocks     = [local.any_where]
    } 
    ingress {
        from_port       = local.app_port
        to_port         = local.app_port
        protocol        = local.tcp
        cidr_blocks     = [local.any_where]
    } 
    ingress {
        from_port       = local.http_port
        to_port         = local.http_port
        protocol        = local.tcp
        cidr_blocks     = [local.any_where]
    }
    egress {
        from_port       = local.all_ports
        to_port         = local.all_ports
        protocol        = local.any_protocol
        cidr_blocks      = [local.any_where]
        ipv6_cidr_blocks = [local.any_where_ip6]
    }
    tags = {
        Name            = "Web Security"
    } 

}

resource "aws_security_group" "dbsecurity" {
    name                = "dbsecurity"
    vpc_id              = aws_vpc.My-Infra.id
    description         = "Created by terraform"
    ingress {
        from_port       = local.ssh_port
        to_port         = local.ssh_port
        protocol        = local.tcp
        cidr_blocks     = [local.any_where]
    } 
    ingress {
        from_port       = local.db_port
        to_port         = local.db_port
        protocol        = local.tcp
        cidr_blocks     = [local.any_where]
    }
    
    tags = {
        Name            = "DB Security"
    } 

}

resource "aws_security_group" "appsecurity" {
    name                = "appsecurity"
    vpc_id              = aws_vpc.My-Infra.id
    description         = "Created by terraform App"
    ingress {
        from_port       = local.app_port
        to_port         = local.app_port
        protocol        = local.tcp
        cidr_blocks     = [local.any_where]
    } 
    ingress {
        from_port       = local.app_port
        to_port         = local.app_port
        protocol        = local.tcp
        cidr_blocks     = [local.any_where]
    } 
    ingress {
        from_port       = local.http_port
        to_port         = local.http_port
        protocol        = local.tcp
        cidr_blocks     = [local.any_where]
    }
    egress {
        from_port       = local.all_ports
        to_port         = local.all_ports
        protocol        = local.any_protocol
        cidr_blocks      = [local.any_where]
        ipv6_cidr_blocks = [local.any_where_ip6]
    }
    tags = {
        Name            = "App Security"
    } 

}

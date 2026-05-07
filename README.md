## Terraform AWS Data Sources & EC2 Deployment
A Terraform configuration that demonstrates the use of AWS Data Sources to fetch existing infrastructure details and provision an EC2 instance using that data — targeting the ap-south-1 (Mumbai) region.

## Overview
This project showcases how Terraform data sources can query existing AWS resources instead of hardcoding IDs. It fetches VPC, Subnet, Security Group, Region, and Availability Zone information dynamically, then uses them to launch an EC2 instance.

## Resources & Data Sources
TypeResourceDescriptiondataaws_vpcFetches existing VPC by tag Name = "default-VPC"dataaws_security_groupFetches existing Security Group by tag Name = "Default"dataaws_subnetFetches subnet filtered by VPC ID and tag Name = "custom-Subnet-1a"dataaws_regionFetches the current AWS regiondataaws_availability_zonesLists all available AZs in the regionresourceaws_instanceLaunches an EC2 instance using the fetched data

## Outputs
OutputDescriptionvpc_idID of the fetched VPCsecurity_groupID of the fetched Security Groupaws_subnetID of the fetched Subnetaws_regionCurrent AWS region nameavailability_zonesList of all available Availability Zones

## EC2 Instance Configuration
ParameterValueAMIami-05d2d839d4f73aafbInstance Typet3.microRegionap-south-1 (Mumbai)SubnetFetched dynamically via data sourceSecurity GroupFetched dynamically via data sourceName Tagmarch-1

## Getting Started
Prerequisites

Terraform >= 1.0
AWS CLI configured with appropriate credentials
An existing AWS VPC tagged Name = "default-VPC"
An existing Security Group tagged Name = "Default"
An existing Subnet tagged Name = "custom-Subnet-1a" within the VPC

## File Structure
└── main.tf       # Main Terraform configuration

## Key Concept: Data Sources

Data sources in Terraform allow you to fetch and reference existing infrastructure without managing it directly. This is useful for:
Avoiding hardcoded resource IDs
Referencing shared infrastructure across teams
Building modular, reusable configurations


## Notes

The AMI ID (ami-05d2d839d4f73aafb) is region-specific to ap-south-1. Update it if you change regions.
Ensure your AWS credentials have sufficient permissions to read VPC, Subnet, Security Group data and create EC2 instances.
The subnet filter uses both VPC ID and a Name tag — make sure both match your existing infrastructure.

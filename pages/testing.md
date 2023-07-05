# :ticket: HF dipl. IT | 1st. Semester

> Go [back](/pages/implementation.md)
>
> Go [further](/pages/report.md)

![Banner](/img/banner5.png)

# Testing

## Completeness Test Report

### Project Overview:

The aim of this project was to implement AWX, the open-source version of Ansible Tower, and successfully achieve all the predefined goals. AWX was selected as the primary topic due to its powerful features and the potential it offers for automating infrastructure management.

<br>

### Objective:

The primary objective of this project was to deploy and configure AWX, ensuring its smooth integration with my existing infrastructure. The project goals were set as follows:

1. Installation and Setup:
-   Deploy AWX on the designated server
-   Build and configure the necessary dependencies and prerequisites
-   Ensure AWX is accessible through a web interface

2. Configuration Management:
-   Create inventories and manage hosts within AWX
-   Define and organize projects, including Git integrations
-   Develop and manage playbooks and job templates

3. Job Execution and Monitoring:
-   Execute Ansible playbooks through AWX job templates
-   Monitor job execution and capture relevant logs
-   Enable scheduling and automation of recurring tasks

4. User Management and Access Control:
-   Set up user accounts and define user roles
-   Implement access controls and permissions based on user roles
<br>


### Completion Summary:

I am pleased to report that all the project goals have been successfully achieved. The implementation of AWX has proven to be highly effective, enabling me to streamline configuration management, automate repetitive tasks, and improve my overall operational efficiency.

<br>

## Mandatory Test Use cases

<details><summary>See all use cases</summary>

### Is AWX installed sucessfully?

- [ ] NO

- [x] YES - See output from the [cloud-init-output.log](/docs/cloud-init-output.log) file

<br>

### Is AWX reachibel over IP / DNS?

- [ ] NO

- [x] YES

![ping1](/img/ping_awx_hostname.png)
![ping2](/img/ping_awx_ip.png)

<br>

### Can I login successfully?

- [ ] NO

- [x] YES

![login](/img/awx_successfully_login.png)

<br>

### Was a solid Organization craeted in AWX?

- [ ] NO

- [x] YES - FO-B

![organization](/img/awx_organization.png)

<br>

### Was a Inventory created in AWX?

- [ ] NO

- [x] YES - My Inventory 

![inventory](/img/awx_inventories.png)

<br>

### Was a Project created in AWX?

- [ ] NO

- [x] YES - GitHub Repository

![project](/img/awx_project.png)

<br>

### Where credentials created for GitHub and SSH key for EC2 instances?

- [ ] NO

- [x] YES - GitHub Deploy Key & EC2 SSH Key

![credentials](/img/awx_credentials.png)

<br>

### Was a template created for a job?

- [ ] NO

- [x] YES - install nginx

![template](/img/awx_template.png)

<br>

### Was a host created inside groups?

- [ ] NO

- [x] YES - Inside my main inventory I created two groups named "webserver" and "ec2_webserver". Under Hosts itselfe I created the host with the name "ec2host"

![host](/img/awx_hosts.png)
![host](/img/awx_hosts2.png)

<br>

### Was the deployment of the job successfully?

- [ ] NO

- [x] YES - Machine could install nginx and is aviable under the IP / DNS

![job](/img/awx_job.png)
![ec2](/img/awx_ec2.png)

</details>

Check out the final report of the entire semester's work here.

<br>
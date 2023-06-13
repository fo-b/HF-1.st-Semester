# :ticket: HF dipl. IT | 1st. Semester

> Go [back](/pages/variation.md)
>
> Go [further](/pages/implementation.md)

![Banner](/img/banner4.png)

# :exclamation: Implementation

In this section, I will try to provide every single step that I have implemented and where I got into trouble. This part should be as comprehensible as possible for everyone and implementable again at any time.

<br>

## :green_book: Working environment

My main work environment was locally on my MacBook, where I tested and developed the entire structure. Multipass was used to quickly create VMs and check if my cloud-config file was written correctly. But at the end, the real machine is running on the cloud servers at TBZ built with maas.IO.

You can track the overall progress of the cloud-config file [here](/pages/cloud-init_dev.md)

<br>

### :closed_lock_with_key: Access maas.IO securely

To get access to the main maas.IO server, I as a student at TBZ, need to use WireGuard to connect successfully but, most importantly, securely through the VPN client.

I got my VPN tunnel file from **Marcel Bernet**, and [here](/docs/wg2.37-template.conf) is the configuration file

<br>

### Which KVM is mine?

I have the cloud-hf-06 machine with 25GB of disk space, 32 GB of RAM and a total of 80 CPU cores.

<br>

### What means composing and where can I do it?

Composing a VM refers to the process of creating and configuring a virtual machine. Composing a VM involves several pieces of information:
-   hostname
-   domain
-   zone
-   resource pool
-   architecture
-   RAM
-   CPU Core
-   Disk space

<br>

To compose a VM I can simply go to my KVM, click on the green "Take action" button, and click on compose.
![Compose](/img/compose.png)

<br>

To compose the vm successfully in maas.IO the KVM needs some more information to complete the action. And in our case, I filled it out like this:


![Compose2](/img/compose2.png)
![Compose3](/img/compose3.png)
As you can see I could also add tags to disk for the specific vm but in our case we don't need it.

---

After clicking on the "Compose machine" button in the background it will compose our vm with our needs and definition. And you can see the status of the process also. 

![Compose4](/img/compose4.png)

And after a few minutes (6min) our vm was ready to go for the further installtion of the OS.

![Compose5](/img/compose5.png)

<br>

### How to deploy the OS and cloud-init

![Compose6](/img/compose6.png)

You can go under the "take action" button and finally go to "deploy" to make the actual deployment of the vm itself.

![Deployment](/img/awx_deployment_1.png)

As you can see there, I can now paste in or upload my necessary cloud-init file.

[Here](/pages/cloud-init_dev.md) you will find the development of the used init file.

<br>

### Before the paste in the cloud-init

Firstly, I have run this bash [script](/docs/createkey.sh) which is creating a new tmp SSH key for my GitHub profile, so the VM is able to clone my repository successfully. The creation itself is made on my local machine, and it will make an API call to GitHub and upload it to my profile. After the API call, it will manipulate the file, and at the end, it will print it out. Then it will sleep for almost 6 minutes to be sure that the Maas server has already loaded everything it needs to run the virtual machine successfully. After 6 minutes, the script is calling another [script](/docs/rmssh.sh) which is deleting the SSH key instantly from my GitHub profile.

---

### During & After paste in the cloud-init

[Watch](/videos/createkey.mov) What happens if the script runs?

And here you can see what happens if I paste the cloud-init code to create the VM.

During the whole process, I even received a mail from GitHub with information and confirmation that a new key had been added:

![Mail](/img/github_mail.png)

[Watch](/videos/createvm.mov) how I did it step by step and how I could login on the Ansible AWX Panel

Here you can find the whole [cloud-init-output.log](/docs/cloud-init-output.log) file where you can see and confirm that the whole installation of Ansible AWX was successful!

<br>

### Login into AWX GUI

We can now easily access the AWX web portal directly through the machine's IP address or over the DSN name.

- IP: 10.0.32.55
- DNS: http://awk-55

<br>

Login credentials are the following:
- admin
- password

![AWX login](/img/awk_login.png)

<br>

### Creating Organization

After the successful login, I needed to create and define a new organization within AWX. It is needed to give it a solid proper name and, if you like, a description.

<br>

GUI:

Go under Access -> Organizations.

That is the general overview of my existing organizations.
![Organization_1](/img/org_1.png)

Click on Add and define a new one
![Organization_2](/img/org_2.png)
<br>

AWX CLI:
```
awx organization create --name "Digitec" --description "Digitec AG" -f human
```
<br>
<br>

#### Building Inventory

GUI:

Go under Ressources -> Inventories

That is the general overview of my existing inventories.
![Inventory_1](/img/inv_1.png)

Click on Add and define a new one.
![Inventory_2](/img/inv_2.png)
<br>

AWX CLI:
```
awx inventory create --name "Digitec Inventory" --organization 4 -f human
```
<br>
<br>

#### Adding credentials

GUI:

Go under Ressources -> Credentials

That is the general overview of all my credentials.
![Credentials_1](/img/crendential_1.png)

Click on Add and define a new one.

SSH key for our EC2 instances, to be able to login without a password prompt.
![Credentials_2](/img/crendential_2.png)

Git Deploy Key to be able to clone our private repository
![Credentials_3](/img/credential_3.png)
<br>

AWX CLI:
```
awx credential create --credential_type 2 --name "Git Deploy Key" --organization 4 -f human
```
<br>
<br>

#### Create Project

GUI:

Go under Ressources -> Projects
![Project_1](/img/project_1.png)

Click on Add and define a new one.
![Project_2](/img/project_2.png)

After successfully syncing with the correct credential and connection, it pops up the green flag.
![Project_3](/img/project_3.png)
<br>

AWX CLI:
```
awx projects create --name "Repo Name" --organization 4 --scm_type git --scm_url "git@github.com:fo-b/Ansible_Playbooks.git" -f human
```
<br>
<br>

#### Define job templates

GUI:

Go under Ressources -> Templates
![Template_1](/img/template_1.png)

Click on Add and define a new one.
![Template_2](/img/template_2.png)

Inside the "Playbook" field, you can see all the different playbooks I have in my repository, and there we can choose the correct one.

AWX CLI:
```
awx job_templates create --name "install apache2" --project 21 --inventory 4 --playbook "install apache2" -f human
```
<br>
<br>

### Create EC2 instance

To be able to create a new EC2 instance inside the AWS Academy, I need to login to the web portal and choose the correct course. After choosing the correct course, I can easily start my own lab in a few minutes.

![AWS_Academy_1](/img/aws_1.png)

Under EC2, I can very quickly deploy an empty EC2 instance with my desired name, and as an OS, I choose Ubuntu because I have only tested it with it. As a key pair, I choose my earlier-created key, which is already located locally on my MacBook. It is also the same for the security group, which was created earlier. In the already created security group, the following ports are open:

![AWS_security_1](/img/sec_grp.png)

After a few minutes, the earlier-created VM should be done like this:

![AWS_host_1](/img/aws_host.png)

### Adding Host in Hosts

At this point, I can copy the public IP from the VM and create back on AWX my host entry.

GUI:

Go under Ressources -> Hosts
![Host_1](/img/host_1.png)

Click on Add and define a new one.
![Host_2](/img/host_2.png)

<br>

AWX CLI:
```
awx hosts create --name "X.X.X.X" --inventory 4 -f human
```
<br>
<br>


### Run the template job

GUI:

Go under Ressources -> Templates
![Run_1](/img/run_1.png)

Click on "Launch Template," and the template will try to perform the installation on the machines.
![Run_2](/img/run_2.png)

<br>

AWX CLI:
```
awx job_templates launch 22 -f human
```
<br>

> Jump [up](#🎫-hf-dipl-it--1st-semester)
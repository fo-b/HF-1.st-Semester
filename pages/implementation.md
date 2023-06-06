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

Firstly I have run this bash [script](/docs/createkey.sh) which is creating a new tmp SSH Key for my GitHub profile so the vm is able to clone my repository sucessfully. Creation itself is made on my local nachine and it will make a API call to GitHub and upload it to my profile. After the API call it will manipulate the file and at the end it will print it out. Then it will sleep almost 6min to be sure that maas has already loading everything he needs to run the vm sucessfully. After the 6min the script is calling another [script](/docs/rmssh.sh) which is deleting the SSH Key instantly from my GitHub profile

---

### During & After paste in the cloud-init

[Watch](/videos/createkey.mov) what happens if the script runs!

And here you can see what happens if I would paste the cloud-init to create the vm

During the whole process I even receive a mail from GitHub as information and confirmation that a new key was added:

![Mail](/img/github_mail.png)

[Watch](/videos/createvm.mov) how I did it Step by Step and how I could login on the Ansible AWX Panel

Here you can find the whole [cloud-init-output.log](/docs/cloud-init-output.log) file where you can see and confirm that the whole installation of Ansible AWX was sucessfully!

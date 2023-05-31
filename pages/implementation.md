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

You can track the overall progress of the cloud-config file [here](/docs)

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

### How to deploy the OS and cloud-init

![Compose6](/img/compose6.png)

You can go under the "take action" button and finally go to "deploy" to make the actual deployment of the vm itself.

![Deployment](/img/awx_deployment_1.png)

As you can see there, I can now paste in or upload my necessary cloud-init file. [Here](/pages/cloud-init_dev.md) you will find the development of the used init file.
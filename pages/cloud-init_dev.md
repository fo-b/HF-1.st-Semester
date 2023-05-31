# :ticket: HF dipl. IT | 1st. Semester

> Go [back](/pages/implementation.md)
>

## Cloud-init development

### :one: version
To create the cloud-init file at all, I needed to know exactly what I should have on my system. These were the necessary packages and edits:

<details>
  <summary>See code</summary>

```
sudo apt update -y

sudo apt upgrade -y

sudo apt install python-setuptools -y

sudo apt install python3-pip -y

sudo pip3 install ansible

sudo apt install docker docker.io -y

sudo pip3 install docker-compose

sudo usermod -aG docker ubuntu

sudo git clone https://github.com/ansible/awx.git

cd awx/installer

sudo nano inventory (edits)

ansible-playbook -i inventory install.yml

```

[Here](/docs/cloud-init_v1) the file

</details>

<br>

### :two: version
Because the first version isn't an actually useful cloud-init file, I moved it correctly to the cloud-init format:

<details>
  <summary>See code</summary>

```
#cloud-config
package_update: true
package_upgrade: true

groups:
  - docker

system_info:
  default_user:
    groups: [docker]

packages:
  - git
  - python3-pip
  - docker.io

runcmd:
  - sudo apt install python-setuptools
  - sudo pip3 install ansible
  - sudo pip3 install docker-compose
  - git clone -b 17.0.1 https://github.com/ansible/awx.git
  - sudo usermod -aG docker ubuntu
  - sed -i '/admin_password=/s/^# //g' /awx/installer/inventory
  - ansible-playbook -i /awx/installer/inventory /awx/installer/install.yml

```

[Here](/docs/cloud-init_v2) the file

</details>

<br>

### :three: version
But even the second version wasn't that nice, and for everybody, it was unstable. And I saw something fishy, like, why should I install Ansible like on the command if I can just move it to the packages section?

<details>
  <summary>See code</summary>

```
#cloud-config
package_update: true
package_upgrade: true

groups:
  - docker

system_info:
  default_user:
    groups: [docker]

packages:
  - git
  - python3-pip
  - docker.io
  - ansible

runcmd:
  - sudo apt install python-setuptools
  - sudo pip3 install docker-compose
  - git clone -b 17.0.1 https://github.com/ansible/awx.git
  - sudo usermod -aG docker ubuntu
  - sed -i '/admin_password=/s/^# //g' /awx/installer/inventory
  - ansible-playbook -i /awx/installer/inventory /awx/installer/install.yml

```

[Here](/docs/cloud-init_v3) the file

</details>

<br>

### :four: version
But to be honest, at this point, I thought, no this isn't still what I want. So I changed it again to something more secure and simple:

<details>
  <summary>See code</summary>

```
#cloud-config

write_files:
- path: /tmp/key
  permissions: '0600'
  content: |
    -----BEGIN OPENSSH PRIVATE KEY-----
    my key
    -----END OPENSSH PRIVATE KEY-----

runcmd:
  - export GIT_SSH_COMMAND="ssh -i /tmp/key -o StrictHostKeyChecking=no"
  - git clone git@github.com:fo-b/bash.git /bash
  - bash /bash/awx/install.sh

```

[Here](/docs/cloud-init_v4) the file

<br>

Maybe you think, okay, he just cloned his own repository, but what exactly is the install.sh script?



<details>
  <summary>Here you can see what's inside</summary>

```
#!/bin/bash

#Update system
sudo apt-get update -y
sudo apt-get upgrade -y

#Ansible
sudo apt install python-setuptools -y
sudo apt install python3-pip -y
sudo pip3 install ansible

#Docker
sudo apt install docker docker.io -y
sudo pip3 install docker-compose

sudo usermod -aG docker ubuntu

#clone awx repo
git clone -b 17.0.1 https://github.com/ansible/awx.git /tmp/awx

#Uncomment line in inventory
sed -i '/admin_password=/s/^# //g' /tmp/awx/installer/inventory

#Run Ansible Playbook
ansible-playbook -i /tmp/awx/installer/inventory /tmp/awx/installer/install.yml
```
</details>

<br>

I think this is a solid solution to have. The reason why I think so is because I clone my private repository from only the private key, which will be created automatically on my host. After the clone, it will destroy itself again, and it will run only one single bash script, which will handle the rest of the AWX installation.

</details>



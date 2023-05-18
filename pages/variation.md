# :ticket: HF dipl. IT | 1st. Semester

> Go [back](/pages/planning.md)
>
> Go [further](/pages/implementation.md)

![Banner](/img/banner3.png)

# :question: Variation

The three suggested versions are provided in the variant summary, along with each one's benefits and drawbacks.


## Variation overview

### :one: Variation

Variant one includes the following, the whole setup will be installed locally on my MacBook Pro and will use multipass to create the necessary environment for AWX and the dependencies. The main machine will be installed manually and have different manual interactions to run AWX successfully. Multipass would be used as a command tool to create and manage the virtual machines locally.

### :two: Variation

Variant two includes the following, the "physical" machine will be created on maas.IO, and the whole setup will be fully automated with cloud init. This means inside the cloud init, only the "git" and "ansible" packages will be loaded, along with the git clone for the necessary repository and the run of the ansible playbook, which will install and configure the entire AWX software fully automated with their dependencies.

### :three: Variation

Variant three includes the following, everything will be done in Microsoft Azure Cloud. (need more details)

<br>

## Decision matrix

![decision matrix](/img/decision_matrix.png)

As we can see in the decision matrix, I recommend implementing Variant 2. It offers a balanced load-performance ratio and caters precisely to my needs.

> Jump [up](#🎫-hf-dipl-it--1st-semester)
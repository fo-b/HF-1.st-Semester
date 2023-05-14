# :ticket: HF dipl. IT | 1st. Semester

> Go [back](/docs/planning.md)
>
> Go [further]()

![Banner](/img/banner3.png)

# :question: Variation

The three suggested versions are provided in the variant summary, along with each one's benefits and drawbacks.


## Variation overview

### :one: Variation

Variant one includes the following, the whole setup will be installed locally on my MacBook Pro and will use multipass to create the necessary environment for AWX and the dependencies. The main machine will be installed manually and have different manual interactions to run AWX successfully. 

### :two: Variation

Variant two includes the following, the "physical" machine will be created on maas.IO, and the whole setup will be fully automated with cloud init. This means inside the cloud init, only the "git" and "ansible" packages will be loaded, along with the git clone for the necessary repository and the run of the ansible playbook, which will install and configure the entire AWX software fully automated with their dependencies.

### :three: Variation

# :ticket: HF dipl. IT | 1st. Semester

> Go [back](/README.md)
>
> Go [further](/pages/planning.md)

![Banner](/img/banner1.png)

# :grey_exclamation: Client expectations

The client (I) wants to be able to easily automate my Ansible playbooks from one central place and, from there, deploy and manage them. With Ansible, you can design and define IT-workflows and processes very easily. But sometimes you face the issue, you have four different places where you save your playbooks, and you don't remember where you saved them. This is for all of us very frustrating, but it can have an end with AWX.

<br>

## :pencil: Initial position

Research is required on the topic of AWX due I don't fully understand how we can manage the whole setup and what system requirements we need to be able to run AWX successfully on our systems. Also, we need to make one of the most important decisions of the whole project, namely, on which opertating system we want to install and configure AWX.

<br>

Here are the links I used to gain the missing pieces of knowledge of AWX:
-   [RedHat - FAQ](https://www.ansible.com/products/awx-project/faq)
-   [RadHat - Comparing](https://www.redhat.com/cms/managed-files/ma-ansible-vs-awx-datasheet-f13830wg-201808-en_0.pdf)
-   [GitHub - AWX](https://github.com/ansible/awx)

<br>

## :checkered_flag: Feasibility - Now-How-Wow-Matrix

### Evaluate ideas based on feasibility and originality
<i>
"Criteria for the selection of ideas are ultimately subjective and depend on the concrete decision-making situation. However, there are general criteria that often ensure a good pre-selection. The criteria feasibility and originality are very common. In combination, these two criteria are an easy-to-use, helpful tool for sorting ideas into different scoring groups. This becomes very clear when the ideas are visualized using a 2×2 matrix. One axis stands for the degree of feasibility, while the other axis stands for the degree of originality. This results in 4 groups (or "clusters") of ideas:
</i>

<br>

<i>

1. low feasibility, no particular originality
2. high feasibility, no particular originality
3. low feasibility, high originality
4. high feasibility, high originality"
</i>

Cf. Prof. Dr. Marin Zec, [sec. 3](https://kreativitätstechniken.info/ideen-bewerten-und-auswaehlen/ideen-bewerten-die-how-wow-now-matrix/#ideen-bewerten-anhand-machbarkeit-und-originalitaet)

<br>

### The How-Wow-Now matrix groups ideas into 4 quadrants
<i>
"The grouping of ideas based on these 4 combinations shows immediately how to proceed with the corresponding ideas. In practice, corresponding English terms have also been established for this: HOW, WOW and NOW. There is no fourth term because the affected group contains ideas that are discarded.
</i>

<br>

<i>

1. Ideas that are not/barely feasible and not particularly original can probably be discarded with a clear conscience
2. NOW!: Ideas that are very feasible, if not particularly original
3. HOW?: Ideas that are probably not that easy to implement, but very original
4. WOW!: Ideas that are both easy to implement and particularly original"

</i>

Cf. Prof. Dr. Marin Zec, [sec. 4](https://xn--kreativittstechniken-jzb.info/ideen-bewerten-und-auswaehlen/ideen-bewerten-die-how-wow-now-matrix/#die-howwownowmatrix-gruppiert-ideen-in-4-quadranten)

<br>

![Machbarkeitsmatrix](/img/feasibility.png)


### :satisfied: NOW!

As I had the idea to use and install AWX plain on a system like we would do it with apache2 is would be a not really original solution because we would install all the dependencies manual and this is too error-prone, and it would take too long.

### :dizzy_face: HOW?

Instead of installing AWX manually, I could automate the whole installation process with the entire dependencies and pre-configure configurations with a Ansible playbook. The challenge would be to break every small step into tasks and describe them sensible. This would mean I should install one time AWX manually to see which steps are mandatory and which are secondary. What I need also to do consider is the Ansible syntax, so that I can avoid mistakes.

### :sunglasses: WOW!

Like I said above, I like the idea to automate the whole installation of AWX with Ansible. Due to the fact that AWX offers good documentation, this increases the overall feasibility of the project. I am aware there are some points where I am not sure myself how I can manage it but, I have learned, there is always a way. If I do it like this, I am getting more experience with Ansible due I am not a ultra expert in it yet and this a huge learn process for me. And also in this way it is a original idea.

<br>


## :trophy: Goals

1.   The **entire** installation of AWX and dependencies should be performed by an Ansible playbook

2.   **Creation** of organizations, inventory, hosts, credentials, projects, and templates inside of AWX

3.   **Successful** deployment from the playbooks to the hosts via AWX

4.   **Security measures** must be defined, such as which user may log in where, where the AWX instance can be reached, etc

<br>

## :pushpin: Project Method

In this semester work, I will use Kanban as the project method.

> Jump [up](#🎫-hf-dipl-it--1st-semester)

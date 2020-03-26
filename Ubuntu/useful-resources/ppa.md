<!--ts-->
   * [PPA](#ppa)
      * [PPA Repositories Management through the Command Line](#ppa-repositories-management-through-the-command-line)
         * [List Added PPA Repositories](#list-added-ppa-repositories)
         * [Add a PPA Repository](#add-a-ppa-repository)
         * [Remove a PPA Repository](#remove-a-ppa-repository)
      * [Reference](#reference)

<!-- Added by: gil_diy, at: 2020-03-26T05:04+02:00 -->

<!--te-->

# PPA

## PPA Repositories Management through the Command Line

### List Added PPA Repositories

If you want to list all the repositories available on your Ubuntu system, enter the following command in the Terminal:

```bash
apt policy
```

### Add a PPA Repository

```bash
add-apt-repository ppa:ppa_name
```


### Remove a PPA Repository

```bash
add-apt-repository --remove ppa:ppa_name
```


## Reference

[Link](https://vitux.com/how-to-add-remove-ppa-repositories-in-ubuntu/)
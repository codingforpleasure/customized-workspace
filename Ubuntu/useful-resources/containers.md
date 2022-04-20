<!--ts-->
   * [Containers](#containers)

<!-- Added by: gil_diy, at: Tue 31 Aug 2021 18:15:49 IDT -->

<!--te-->


# Containers

Docker containers are now the standard format for containers, and all major cloud vendors support Dockerfile contianers, along with Kubernetes container management software.

**Container registry**

All cloud providers have a container registry where they keep your containers.

**Kubernetes management service**

All cloud providers have Kubernetes offering, and this is now the standard for managing container based deployments.

**Dockerfile format**

This is standard for building containers, and it is simple file format. it is best practice to use **lint tools** like **hadolint** in your build process to ensure simple bugs don't leak through.

**Continuous integration with containers**

All cloud providers have cloud-based build systems that allow integration with containers. 

* Google has Cloud Build
* Amazon has AWS CodePipeline
* Azure has Azure Pipelines

They all can build containers and register them into a container registry, as well as build projects using containers.


**Deep container integration into all cloud services**

When you get into managed services in platforms on clouds, you can rest assured they all have one thing in common - containers!
**Amazon Sagemaker** - a managed machine learning platform, uses containers.
The cloud development evironment **Google Cloud Shell** uses containers to allow you to customize your development environment.


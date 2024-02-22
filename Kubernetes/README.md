# Azure Kubernetes Service (AKS) Tutorial

<p align="center">
  <img src="figures/kubernetes-logo.png" width="200" />
  <img src="figures/docker-logo.jpg" width="100" /> 
  <img src="figures/github_actions-logo.png" width="180" />
</p>

<p align="center">
  <img src="figures/azure-logo.png" width="200" />
  <img src="figures/aks-logo.jpg" width="100" />
  <img src="figures/github-logo.jpg" width="100" />
</p>



Welcome to the tutorial on Azure Kubernetes Service (AKS) and its ecosystem, including Docker, Azure CLI, Azure Container Registry (ACR), and more. This guide provides insights into deploying and managing containerized applications on Microsoft Azure.

## Contents
- [Docker and Docker Images]
- [Azure Command Line Interface (CLI)]
- [Azure Container Registry (ACR)]
- [Azure Kubernetes Service (AKS)]
- [Application Deployment]
- [Managing AKS Clusters and Node Pools]
- [Persistent Volumes (PV) and Persistent Volume Claims (PVC)]
- [CronJob Configuration in Kubernetes]
- [GitHub Actions Integration]
- [Selecting Azure Virtual Machines and Storage]

## Sample Code Preview

Here's a sneak peek into what you'll learn in this tutorial:

### Deploying an Application in AKS
```bash
# Create a deployment in AKS using the deployment.yaml file
kubectl apply -f deployment.yaml

# Verify the deployment
kubectl get deployment my-app-deployment

# Watch the status of the pods
kubectl get pods -l app=my-app --watch
```
These commands demonstrate how to deploy your application in AKS, verify the deployment, and monitor the status of your pods.

For more detailed explanations and additional code examples, please refer to the full tutorial in the accompanying PDF document.

### Cloud Services

An overview of different cloud services can be found [Virtual Machine Pricing Comparison Across Cloud Services](./Cloud virtual machines/README.md)!

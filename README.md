# Capstone
Udacity CloudDevOps Final Project

> This project deploys a dockerized python application on AWS EKS using rolling deployment.

Following have been used to create and deploy the application:
1. Jenkins for CI/CD pipeline
2. Cloudformation for creating networking infrastructure.
3. Cloudformation to create eks cluster and nodegroup
4. Amazon EC2 instance to run Jenkins, docker, kubectl, pyhton (and its dependencies).
5. Amazon ECR and Amazon EKS

# Overview
CI is done using steps to lint the python application and CD has been done by building docker image and pushing it to Amazon ECR repository and then deploying to Amazon EKS cluster.

  # Software Installation
    1. Launch an Amazon linux 2 instance. (for tasks mentioned in step 4 above)
    2. Run command to configure aws account
        aws configure
    3. Install python3, pylint, flask
        sudo yum update -y
        sudo yum install python36 python36-pip
        sudo pip3 install pylint
        sudo pip3 install flask
    4. Install docker
        sudo amazon-linux-extras install docker
        sudo service docker start
        sudo usermod -a -G docker ec2-user
    5. Install kubectl
        curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
        chmod +x ./kubectl
        sudo mv ./kubectl /usr/local/bin/kubectl
        kubectl version --client
    6. Install Jenkins
        sudo install java-1.8.0-openjdk
        sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
        sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
        sudo yum install jenkins
        sudo service jenkins start
    7. Configure Jenkins with default plugins and then add two more plugins:
        - BlueOcean
        - AWS Pipeline
    8. Open Blue Oceans plugin and configure the github repository.


# Infrastructure installation
1. On Amazon linux 2 instance. (for tasks mentioned in step 4 above)
2. Run command to configure aws account (already done..ignore)
   aws configure
3. Run command from cloudformation folder to create basic infrastructure
  .\aws_create_stack.bat capstone-infra .\capstone-infra.yml .\capstone-infra-params.json
4. Check in aws portal to make sure creation of 'capstone-infra' stack is completed.
5. Run command from cloudformation folder to create eks cluster which will use resources from 'capstone-infra' stack.
    .\aws_create_stack.bat eks-cluster-stack .\eks-cluster.yml .\eks-cluster-params.json
6. Check in aws portal to make sure creation of 'eks-cluster-stack' stack is completed. This usually takes `15-20 minutes`.
7. Run command from cloudformation folder to create node-group in the cluster created in previous step.
  .\aws_create_stack.bat eks-nodegroup-stack .\eks-cluster-nodegroup.yml .\eks-cluster-params.json
8. Check in aws portal to make sure creation of 'eks-nodegroup-stack' stack is completed. This usually takes `10-15 minutes`

This project has two Jenkins files:
1. `Jenkinsfile-for creating first deployment` - to install deployment and Load Balancer service. This file is used only once.
2. `Jenkinsfile` - for rolling deployment


# Screenshots
The screenshots for failing linter and passing builds and succesful kubernetes deployment is available in `screenshots` folder.
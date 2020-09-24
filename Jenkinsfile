pipeline {
    agent any
    environment {
    PATH = "/usr/local/bin:$PATH"
    }
    stages {
            stage('Lint python') {
        steps {
          echo "PATH is: $PATH"
          sh 'pylint --disable=R,C,W1203 **.py'
      }
    }

    stage('Build Docker image') {
        steps {
          sh 'docker build -t app .'
      }
    }

    stage('Push image') {
        steps {
          withAWS(region:'us-west-2',credentials:'aws') {
            sh 'aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 909060519780.dkr.ecr.us-west-2.amazonaws.com'
            sh 'docker build -t app .'
            sh 'docker tag app:latest 909060519780.dkr.ecr.us-west-2.amazonaws.com/capstone:latest'
            sh 'docker push 909060519780.dkr.ecr.us-west-2.amazonaws.com/capstone:latest'
            }
        }
      }

      stage('Create kubeconfig') {
        steps {
          withAWS(region:'us-west-2',credentials:'aws') {
            sh 'aws eks --region us-west-2 update-kubeconfig --name CapstoneCluster'  
           }
        }
      }

      stage('Deploy containers') {
        steps {
          withAWS(region:'us-west-2',credentials:'aws') {
            sh "kubectl set image deployment/capstone-demo web=909060519780.dkr.ecr.us-west-2.amazonaws.com/capstone:latest"
            sh 'kubectl apply -f deployments/deployments.yml'  
            sh "kubectl get nodes"
            sh "kubectl get deployment"
            sh "kubectl get pod -o wide"
            sh "kubectl get service/capstone-demo"
           }
        }
      } 

     
  }
}
  
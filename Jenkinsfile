pipeline {
    agent any
    environment {
    PATH = "/usr/local/bin:$PATH"
    }
    stages {
      

      stage('Deploy containers') {
        steps {
          withAWS(region:'us-west-2',credentials:'aws') {
            sh 'kubectl apply -f ${WORKSPACE}/deployments.yaml'  
            sh 'kubectl apply -f service.yaml'
           }
        }
      } 

     
  }
}  
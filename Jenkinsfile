pipeline {
    agent any
    environment {
    PATH = "/home/ec2-user/.local/bin:/home/ec2-user/bin:$PATH"
  }
    stages {
      stage('Lint python') {
        steps {
          echo "PATH is: $PATH"
          sh 'pylint --disable=R,C,W1203 **.py'
      }
    }
     
  }
}  
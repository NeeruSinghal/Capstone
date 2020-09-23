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
     
  }
}  
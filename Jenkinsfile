pipeline {
    agent any
    stages {
      stage('Lint python') {
        steps {
          echo "PATH is: $PATH"
          sh 'pylint --disable=R,C,W1203 **.py'
      }
    }
     
  }
}  
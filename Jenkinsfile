pipeline {
    agent any
    stages {
      stage('Lint python') {
        steps {
          sh 'pylint --disable=R,C,W1203 **.py'
      }
    }
     
  }
}  
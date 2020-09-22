pipeline {
    agent any
    stages {
      stage('Lint python') {
        steps {
          echo "PATH is: $PATH"
          sh '/usr/local/bin/pylint --disable=R,C,W1203 **.py'
      }
    }
     
  }
}  
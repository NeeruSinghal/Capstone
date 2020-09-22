pipeline {
    agent any
    environment {
    PATH = "/home/ec2-user/.local/bin:/home/ec2-user/bin:$PATH"
  }
    stages {
      stage('Lint python') {
        steps {
          echo "PATH is: $PATH"
          sh '
          sudo chmod +x /home/ec2-user/.local/bin/pylint
          /home/ec2-user/.local/bin/pylint --disable=R,C,W1203 **.py'
      }
    }
     
  }
}  
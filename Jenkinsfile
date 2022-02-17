pipeline {
  agent any
  environment {
    rgistry = "663889784592.dkr.ecr.us-east-1.amazonaws.com/demo-ecr"
  }

  stages {
    stage ("Build Docker Image") {
      steps {
	script {
          sh "docker build -t nginx:latest Dockerfile"
	}
      }
    }
  }
}

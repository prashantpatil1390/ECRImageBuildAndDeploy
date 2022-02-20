pipeline {
  agent any
  environment {
  accountId="316615696866"
  region="us-east-1"
  }

  stages {
    stage ("Login to ECR Repo") {
      steps {
        script {
          sh  "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $accountId.dkr.ecr.us-east-1.amazonaws.com"
        }
      }
    }
	stage ("Build Docker Image") {
      steps {
	    script {
          sh "docker build -t $accountId.dkr.ecr.us-east-1.amazonaws.com/demo-ecr:latest ."
	    }
      }
    }
    stage ("Push Image to ECR Repo") {
      steps {
        script {
          sh "docker push $accountId.dkr.ecr.us-east-1.amazonaws.com/demo-ecr:latest"
        }
      }
    }
  }
}

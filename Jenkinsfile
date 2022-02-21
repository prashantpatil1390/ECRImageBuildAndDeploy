pipeline {
  agent any
  
  environment {
    accountId = "939600059814"
    registry = "${accountId}.dkr.ecr.us-east-1.amazonaws.com/demo-ecr"
	THE_BUTLER_SAYS_SO=credentials('AcloudGuru-Playground-AWS-Creds')
  }
  
  stages {
    
    stage ('Checkout'){
      steps {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/prashantpatil1390/ECRImageBuildAndDeploy.git']]])
      }
    }
	
    stage ('Build Docker Image'){
      steps {
        script {
	  dockerImage = docker.build registry
        }
      }
    }
	
    stage ('Push Image to ECR'){
      steps {
        script {
   	  sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${accountId}.dkr.ecr.us-east-1.amazonaws.com'
	  sh 'docker push ${accountId}.dkr.ecr.us-east-1.amazonaws.com/demo-ecr:latest'
        }
      }
    }
  }
}

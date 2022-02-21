pipeline {
  agent any
  
  environment {
    accountId = "939600059814"
    registry = "${accountId}.dkr.ecr.us-east-1.amazonaws.com/demo-ecr"
//    THE_BUTLER_SAYS_SO=credentials('AcloudGuru-Playground-AWS-Creds')
    aws_creds=credentials('AcloudGuru-Playground-AWS-Creds')
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

   stage ('Deploy ECR image to ECS'){
     steps {
       script {
         sh 'aws ecs describe-task-definition --task-definition nginxapp-task  --region="us-east-1" > task-def.json'
//         sh 'aws ecs register-task-definition --family nginxapp-task --region="us-east-1" --cli-input-json file://task-def.json'
         sh 'aws ecs register-task-definition --family nginxapp-task --region="us-east-1" --cli-input-json <task-def.json'
       }
     }
   }
  }
}

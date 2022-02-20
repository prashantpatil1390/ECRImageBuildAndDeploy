pipeline {
  agent any
  environment {
  accountId = "316615696866"
  region = "us-east-1"
  jenkins_cred_id = "fcda784c-523f-403f-a9bf-c152159972ca"
  }

  stages {
    stage("Build and Deploy Docker Image"){
      steps {
        script {
	      docker.withRegistry (
	        'https://$accountId.dkr.ecr.$region.amazonaws.com',
                'ecr:$region:$jenkins_cred_id'){
	        def myImage = docker.build('demo-ecr')
	        myImage.push('latest')
	        }
        }
      }
    }
  }
}

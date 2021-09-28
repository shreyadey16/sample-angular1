pipeline {
 def dockerRun='docker run -p 8080:8080 -d --name ang-app shreyadey16/ang-app'
  agent {
    label 'agent'
  }
    tools{
        nodejs 'NodeJS'
      dockerTool 'docker'
    }

    stages {
        stage('scm') {
            steps {
                git branch:'master',url:'https://github.com/shreyadey16/sample-angular1.git'
            }
        }
         stage('install') {
            steps {
                sh 'npm install'
            }
        }
          stage('Build'){
	         steps{
                sh 'npm run build'
        }
    }
        stage('Build Docker Image'){
          steps{
            script{
               docker.withTool('docker'){
               sh 'docker version'
               sh 'docker build -t  ang-app .'
               sh 'docker tag ang-app shreyadey16/ang-app'
            }
          }
          }
        }
      stage("Docker Login"){
        steps{
        withCredentials([string(credentialsId: 'DOCKER_HUB_PASSWORD', variable: 'PASSWORD')]) {
            sh 'docker login -u shreyadey16 -p $PASSWORD'
        }
    } 
    }
      stage("Push Image to Docker Hub"){
        steps{
        sh 'docker push  shreyadey16/ang-app'
    }
    }
      stage("Run Container on Dev Server"){
        steps{
        sshagent(['dev-server']) {
          sh "ssh -o StrictHostKeyChecking=no ec2-user@3.92.18.98 ${dockerRun}"
      }
    }
  }
 }
}

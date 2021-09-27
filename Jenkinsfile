pipeline {
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
    }
}

pipeline {
    agent any
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
                sh 'npm run build --prod'
        }
    }
        stage('Build Docker Image'){
            steps{
               sh 'docker build -t  shreyadey16/ang-prac-image .'
            }
          }
    }
}

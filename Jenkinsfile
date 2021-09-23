node{
    stage('Checkout SCM'){
        git branch:'master',url:'https://github.com/shreyadey16/sample-angular1.git'
    }
    stage('Install node modules'){
        sh "/usr/bin/npm install"
    }
    stage("Build"){
        sh "npm run build --prod"
    }
}
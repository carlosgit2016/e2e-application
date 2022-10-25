pipeline {
    agent any

    stages {

        stage('Building preparation'){
            steps {
                sh 'ls -lha'
                sh 'touch mytest'
                sh 'whoami'
                sh 'echo $HOST'
                sh 'env'
            }
        }

        stage('Building image'){
            steps {
                sh 'docker --version'
            }
        }

        stage('Publishing image'){
            steps {
                echo 'Publishing... docker image'
            }
        }

    }
}
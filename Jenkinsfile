pipeline {
    agent any

    stages {
        stage('Building image'){
            steps {
                bash '& docker --version'
            }
        }

        stage('Publishing image'){
            steps {
                echo 'Publishing... docker image'
            }
        }

    }
}
pipeline {
    agent { label 'custom' }

    environment {
        DOCKERHUB_CREDENTIALS=credentials('carlosflor-creds')
    }

    stages {

        stage('Tests'){
            steps {
                echo 'Test step'
                sh 'git branch --show-current'
                echo 'branch ' + env.BRANCH_NAME
            }
        }

        stage('Building images'){
            steps {
                echo 'Building images based on git diff'
                sh './build_images.sh ' + env.BRANCH_NAME
            }
        }

        stage('Publishing image'){
            when {
                branch 'main'
            }
            steps {
                echo "Logging to docker hub"
                sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login --username $DOCKERHUB_CREDENTIALS_USR --password-stdin"
            }
        }

    }
}
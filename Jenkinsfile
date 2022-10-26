pipeline {
    agent { label 'custom' }

    stages {
        stage('Building images'){
            steps {
                echo 'Building images based on git diff'
                sh './build_images.sh'
            }
        }

        stage('Publishing image'){
            when {
                branch 'main'
            }
            steps {
                echo 'Publishing... docker image'
            }
        }

    }
}
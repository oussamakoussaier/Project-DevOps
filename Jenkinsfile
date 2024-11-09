pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/oussamakoussaier/Project-DevOps.git'
        GIT_CREDENTIALS_ID = 'github_token'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'OussamaKoussaier', credentialsId: "${GIT_CREDENTIALS_ID}", url: "${GIT_REPO}"

            }
        }

        stage('Clean') {
            steps {
                script {
                    if (fileExists('target')) {
                        echo 'Cleaning target directory...'
                        sh 'rm -rf target'
                    }
                }
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', allowEmptyArchive: true
            }
        }
    }

   
}

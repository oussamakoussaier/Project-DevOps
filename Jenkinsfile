pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/oussamakoussaier/Project-DevOps.git'
        GIT_CREDENTIALS_ID = 'github_token'
        MAIL_RECIPIENT = 'imen.abassi@esprit.tn'
        MAIL_SENDER = 'support@darkmatter-corp.com'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'ImenAbassi-5NIDS1', credentialsId: "${GIT_CREDENTIALS_ID}", url: "${GIT_REPO}"

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

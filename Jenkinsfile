pipeline {
    agent any
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'OussamaKoussaier', url: 'https://github.com/oussamakoussaier/Project-DevOps.git'
            }
        }
        stage('Unit Testing') {
            steps {
                sh "mvn test"
            }
        }
        stage('Integration Testing') {
            steps {
                sh "mvn verify -DskipUnitTests"
            }
        }
        stage('Maven Build') {
            steps {
                sh "mvn clean install"
            }
        }
        stage('Static Code Analysis') {
            steps {
                script {
                    withSonarQubeEnv(credentialsId: 'sonar-api-key') {
                        sh 'mvn clean package sonar:sonar'
                    }
                }
            }
        }
        stage('Quality Gate Status'){
            steps{
               script{
                   waitForQualityGate abortPipeline: false, credentialsId: 'sonar-api-key'
               } 
            }
        }
        stage('Upload War File to Nexus'){
            steps{
                script {
                    def fileToUpload = 'target/gestion-station-ski-1.0.jar'
                    // Ensure the file exists before uploading
                    if (fileExists(fileToUpload)) {
                        nexusArtifactUploader artifacts: 
                        [
                            [artifactId: 'gestion-station-ski',
                             classifier: '', file: fileToUpload,
                             type: 'jar']
                        ],
                        credentialsId: 'nexus-auth',
                        groupId: 'tn.esprit.spring',
                        nexusUrl: 'http://192.168.33.10:8081',  // Correct URL without the extra http://
                        nexusVersion: 'nexus3', 
                        protocol: 'http',  // Change to 'https' if your Nexus instance uses HTTPS
                        repository: 'demoapp-release',
                        version: '1.0'
                    } else {
                        error "File ${fileToUpload} does not exist. Please check the build output."
                    }
                }
            }
        }
    }
}

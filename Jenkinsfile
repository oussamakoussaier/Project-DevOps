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
                    // Ensure the correct SonarQube credentials ID is used here
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
                script{
                    nexusArtifactUploader artifacts: 
                        [
                            [artifactId: 'gestion-station-ski',
                             classifier: '',
                             file: "target/app-${mavenPom.version}.war",
                             type: 'war']
                        ],
                        credentialsId: 'nexus-auth',
                        groupId: 'tn.esprit.spring',
                        nexusUrl: '192.168.33.10:8081',
                        nexusVersion: 'nexus3', 
                        protocol: 'http',
                        repository: 'demoapp-release',
                        version: '1.0'
                }
            }
        }
    }
}

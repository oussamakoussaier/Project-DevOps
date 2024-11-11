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
                    def readPomVersion = readMavenPom file: 'pom.xml'
                    def nexusRepo = readPomVersion.version.endsWith('SNAPSHOT') ? "demoapp-snapshot" : "demoapp-release"


                    nexusArtifactUploader artifacts: 
                        [
                            [artifactId: 'gestion-station-ski',
                             classifier: '', 
                             file: 'target/gestion-station-ski-1.0.jar',
                             type: 'jar']
                        ],
                        credentialsId: 'nexus-auth',
                        groupId: 'tn.esprit.spring',
                        nexusUrl: '192.168.33.10:8081',
                        nexusVersion: 'nexus3', 
                        protocol: 'http',
                        repository: nexusRepo,
                        version: "${readPomVersion.version}"
                }
            }
        }
        stage('Docker Image Build'){
            steps{
                script{
                    sh "docker image build -t $JOB_NAME:v1.$BUILD_ID"
                    sh "docker image tag $JOB_NAME:v1.$BUILD_ID mohamedoussama.koussaiet@esprit.tn/$JOB_NAME:v1.$BUILD_ID"
                    sh "docker image tag $JOB_NAME:v1.$BUILD_ID mohamedoussama.koussaiet@esprit.tn/$JOB_NAME:latest"
                }
            }
        }

    }
}

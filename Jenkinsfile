pipeline {
    agent any
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'ImenAbassi-5NIDS1', url: 'https://github.com/oussamakoussaier/Project-DevOps.git'
            }
        }
       /* stage('Unit Testing') {
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
                    withSonarQubeEnv(credentialsId: 'sonar-api') {
                        sh 'mvn clean package sonar:sonar'
                    }
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
                             file: 'target/gestion-station-ski-1.0.jar',
                             type: 'jar']
                        ],
                        credentialsId: 'nexus-auth',
                        groupId: 'tn.esprit.spring',
                        nexusUrl: '192.168.33.10:8081',
                        nexusVersion: 'nexus3', 
                        protocol: 'http',
                        repository: 'final-release',
                        version: '1.0'
                }
            }
        }*/
       stage('Build JAR') {
            steps {
                // Exécutez Maven pour compiler et packager votre projet
                sh 'mvn clean package'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // Construire l'image Docker avec le tag `votreutilisateur/achat:1.0.0`
                sh 'docker build -t imenabassi/gestion-station-ski-1.0 .'
            }
        }
        
        stage('Push to DockerHub') {
            steps {
                // Se connecter à DockerHub et pousser l'image
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                    sh 'docker push imenabassi/gestion-station-ski-1.0'
                }
            }
        }

 

    }
}

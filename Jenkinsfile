pipeline {
    agent any
    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'ImenAbassi-5NIDS1', url: 'https://github.com/oussamakoussaier/Project-DevOps.git'
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
                    withSonarQubeEnv(credentialsId: 'sonar-api') {
                        sh 'mvn clean package sonar:sonar'
                    }
                }
            }
        }
      

 

    }
}

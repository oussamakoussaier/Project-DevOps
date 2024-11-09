pipeline {
    agent any
    tools {
        maven 'maven3'
    }
    options {
        buildDiscarder logRotator(daysToKeepStr: '5', numToKeepStr: '7')
    }
    stages {
        stage('Build') {
            steps {
                sh script: 'mvn clean package'
                archiveArtifacts artifacts: 'target/*.war', onlyIfSuccessful: true
            }
        }
        stage('Upload War To Nexus') {
            steps {
                script {
                    def mavenPom = readMavenPom file: 'pom.xml'
                    nexusArtifactUploader artifacts: [
                        [
                            artifactId: 'gestion-station-ski', 
                            classifier: '', file: 'target/app-1.0.0.war', 
                            type: 'war']
                    ], 
                        credentialsId: 'nexus', 
                        groupId: 'cloudgeeks', 
                        nexusUrl: '192.168.33.10:8081/repository/app/', 
                        nexusVersion: 'nexus3', protocol: 'http', 
                        repository: 'http://192.168.33.10:8081/repository/app/', 
                        version: '1.0'
                }
            }
        }
    }
}

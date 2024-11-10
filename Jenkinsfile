pipeline {
    agent any
       stages{
           stage('Git Checkout'){
               steps{
                   git branch: 'OussamaKoussaier', url: 'https://github.com/oussamakoussaier/Project-DevOps.git'
               }
           }
           stage('UNIT Testing'){
               steps{
                   sh "mvn test"
               }
           }
           stage('Integration Testing'){
               steps{
                   sh "mvn verify -DskipUnitTests"
               }
           }
           stage('Maven Build'){
               steps{
                   sh "mvn clean install"
               }
           }
           stage('Static Code Analysis'){
               steps{
                   script{
                   withSonarQubeEnv(credentialsId: 'sonar-api-key') {
                       sh "mvn clean package sonar:sonar -Dsonar.login=${SONAR_TOKEN}"
                   }
                }
            }
         }           
    }
}

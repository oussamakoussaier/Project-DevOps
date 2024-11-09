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
                   sh "mvn -version"
               }
           }
           stage('Integration Testing'){
               steps{
                   sh "mvn verify -DskipUnitTests"
               }
           }
           
       }
}

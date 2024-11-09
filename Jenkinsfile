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
           stage('Integration testing'){
               steps{
                   sh "mvn verify -DskipUnitTests"
               }
           }
           
       }
}

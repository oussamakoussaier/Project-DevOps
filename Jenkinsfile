pipeline {
    agent any
       stages{
           stage('Git Checkout'){
               steps{
                   git branch: 'OussamaKoussaier', url: 'https://github.com/oussamakoussaier/Project-DevOps.git'
               }
           }
           stage('Integration test'){
               steps{
                  sh 'mvn verify -DskipUnitTests'
               }
           }  
           
       }
}

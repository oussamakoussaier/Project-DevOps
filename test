pipeline {
    agent any
       stages{
           stage('Git Checkout'){
               steps{
                   git branch: 'OussamaKoussaier', url: 'https://github.com/oussamakoussaier/Project-DevOps.git'
               }
           }
        stage('Upload War File to Nexus'){
            steps{
                script{
                    def readPomVersion = sh(script: "mvn help:evaluate -Dexpression=project.version -q -DforceStdout", returnStdout: true).trim()
                    def nexusRepo = readPomVersion.endsWith('SNAPSHOT') ? "demoapp-snapshot" : "demoapp-release"

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
           
     }
}

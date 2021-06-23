
pipeline {
   agent any

   tools {jdk "JDK11"}


   stages {

      stage('Checkout changes') { 
         steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/adelbenharath/passwordmanager.git']]])
         }
      }
   stage('Code Quality Check via SonarQube') {
   steps {
       script {
          withSonarQubeEnv(credentialsId: 'jenkins-sonar-token') {
             sh "mvn clean package sonar:sonar -DskipTests -Dsonar.projectKey=afnor -Dsonar.projectName=afnor -Dsonar.sources=./src/main -Dsonar.sourceEncoding=UTF-8 -Dsonar.projectBaseDir=${WORKSPACE}"
    // some block
         }
 
           
               
           }
    }
   }

      stage('Compile projects') {
         steps {
         sh "mvn clean install -DskipTests"
         sh "cp target/passwordmanager-0.0.1-SNAPSHOT.jar afnor.jar"
            
         }
      }



     stage('stop current version') {
         steps {
            sh "docker-compose -H tcp://192.168.26.145:2375 -f docker-compose.yml down "

         }
      }
     stage('build docker image') {
         steps {
            sh "docker-compose -H tcp://192.168.26.145:2375 -f docker-compose.yml build "

         }
      }
     stage('Deploy new version') {
         steps {
            sh "docker-compose -H tcp://192.168.26.145:2375 -f docker-compose.yml up -d "

         }
      }




   } // stages

}

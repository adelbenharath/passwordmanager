
pipeline {
   agent any

   tools {jdk "JDK11"}


   stages {

      stage('Checkout changes') { 
         steps {
            checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/adelbenharath/passwordmanager.git']]])
         }
      }

      stage('Compile projects') {
         steps {
         sh "mvn clean install -DskipTests"
         }
      }



    // stage('Deploy') {
      //   steps {
        //    script {
          //     projectName = sh(script: "echo '${params.project_prefix}-${params.env}-${params.project_suffix}'", returnStdout: true).trim()
            //}
            //withEnv(["PROJECT_NAME=${projectName}"]) {
               //withCredentials([file(credentialsId: "${projectName}", variable: 'GC_KEY')]) {
                 // sh('gcloud auth activate-service-account --key-file=${GC_KEY} --project=${PROJECT_NAME}')
                  //sh('gcloud config set project ${PROJECT_NAME}')
                 // sh('cd src/main/appengine && gcloud app deploy -q')
               //}
            //}
         //}
      //}


   } // stages

}

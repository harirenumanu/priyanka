// pipeline{
// agent any
// stages{

//         stage("çheckout") {

//             steps{
//             checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'hati github', url: 'https://github.com/harirenumanu/priyanka.git']])
//         }
//         }
//         stage ("Create") {

//             when {
//                 beforeOptions true
//                 expression {
//                     "${params.Action}" == "${STAGE_NAME}"
//                 }
//             }
//             steps {
//                 script{
//                     if("${params.env}"== "dev") {
//                         sh "terraform init"
//                         sh "terraform plan -var-file=${params.env}.tfvars"
//                         sh "terraform apply -var-file=${params.env}.tfvars -auto-approve"
//                     }
//                     else if("${params.env}"== "test") {
//                         sh "terraform init"
//                         sh "terraform plan -var-file=${params.env}.tfvars"
//                         sh "terraform apply -var-file=${params.env}.tfvars" 
//                 }
//             }
//         }
//         }
//         stage ("Destroy") {
//             when {
//                 expression {
//                     "${params.Action}" == "${STAGE_NAME}"
//                 }
//             }
//             steps {
//                 sh "terraform destroy --auto-approve"
//         }
//         }
// }
// }


pipeline {
    agent any
    stages{
        stage ('Checkout'){
            steps {
                git credentialsId: 'github', url: 'https://github.com/harirenumanu/priyanka.git'
            }
        }
        stage ('Build') {
            steps {
                sh 'echo "this is build stage..."'
            }
        }
        stage ('Test') {
            steps {
                sh 'echo "this is test stage..."'
            }
        }
    }
}

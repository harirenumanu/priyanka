pipeline {
    agent any
    stages {
        stage('test AWS credentials') {
            steps {
                withAWS(credentials: 'AWSCredentials', region: 'us-east-1') {
                    sh 'echo "hello Jenkins">hello4.txt'
                    s3Upload acl: 'Private', bucket: 'hrenumanu', file: 'hello4.txt'

                }
            }
        }
         stage('Checkout Code') {
             steps {
                   checkout scm
             }
             }
         stage('Init Terraform') {
            steps {
                withAWS(credentials: 'AWSCredentials', region: 'us-east-1') {
                  sh 'terraform init'      

                }
            }
        }
          stage('Apply Terraform') {
            steps {
                withAWS(credentials: 'AWSCredentials', region: 'us-east-1') {
                    sh 'terraform plan'
                }
            }
                 }
            }
}

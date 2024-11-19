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
                   git credentialsId: 'githubcredentials', url: 'https://github.com/harirenumanu/priyanka.git'
             }
             }
         stage('Init Terraform') {
            steps {
                sh 'terraform init'      
               
            }
        }
          stage('Apply Terraform') {
            steps {
                    sh 'terraform destroy --auto-approve'
                }
                 }
            }
}

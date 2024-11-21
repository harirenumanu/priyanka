pipeline {
    agent any
    stages {
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
        stage('Terraform plan') {
            steps {
                sh 'terraform plan -var-file=${varfile}'      
               
            }
        }

        stage('Terraform apply and destroy') {
            steps {
                sh 'terraform ${action}  --auto-approve'      
               
            }
        }
        
            }
}

pipeline {
    agent any
    parameters {
        string(name: 'YAML_FILE', description: 'The YAML file to be applied to the Kubernetes cluster')
    }
    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'hari-github', url: 'https://github.com/harirenumanu/priyanka.git'
            }
        }
        stage('Deploy') {
             environment {
                KUBECONFIG = '/tmp/kubeconfig' // Temporary kubeconfig path
            }
            steps {
                withCredentials([aws(credentialsId: 'AWSCredentials')]) {
                    // Update kubeconfig for EKS cluster
                    sh """
                        aws eks update-kubeconfig --name eks-cluster --region us-east-1
                    """
                    
                    // Apply the specified YAML file
                    sh """
                        kubectl apply -f ${params.YAML_FILE}.yaml --validate=false
                    """
                }
            }
        }
    }
}

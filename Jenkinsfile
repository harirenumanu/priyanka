pipeline {
    agent any
    parameters {
        string(name: 'YAML_FILE', description: 'The YAML file to be applied to the Kubernetes cluster')
    }
    environment{
        HOME = '/root'
    }
    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'github', url: 'https://github.com/harirenumanu/priyanka.git'
            }
        }
        stage('Deploy') {
            steps {
                withCredentials([aws(credentialsId: 'AWSCredentials')]) {
                    // Update kubeconfig for EKS cluster
                    sh """
                        aws eks update-kubeconfig --name eks-cluster --region us-east-1 --kubeconfig ${env.HOME}/.kube/config
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

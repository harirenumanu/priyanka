pipeline {
    agent any
    parameters {
        string(name: 'YAML_FILE', description: 'The YAML file to be applied to the Kubernetes cluster')
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
                        sudo aws eks update-kubeconfig --name Eks-cluster --region us-east-1 --kubeconfig /root/.kube
                    """
                    
                    // Apply the specified YAML file
                    sh """
                       sudo kubectl apply -f ${params.YAML_FILE}.yaml --validate=false
                    """
                }
            }
        }
    }
}

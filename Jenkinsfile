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
                    script {
                        // Use script block for multiple shell commands
                        sh """
                            sudo mkdir -p /root/.kube
                            sudo chmod 755 /root/.kube
                            sudo aws eks update-kubeconfig \
                            --name Eks-cluster \
                            --region us-east-1 \
                            --kubeconfig /root/.kube/config
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
}

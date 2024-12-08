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
                            mkdir -p $HOME/.kube
                            chmod 755 $HOME/.kube
                            aws eks update-kubeconfig \
                            --name Eks-cluster \
                            --region us-east-1 \
                            --kubeconfig $HOME/.kube/config
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

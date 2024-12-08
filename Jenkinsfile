pipeline {
    agent any
    parameters {
        string(name: 'YAML_FILE', description: 'The YAML file to be applied to the Kubernetes cluster')
    }
    
    stages {
        stage('Debug Environment') {
            steps {
                sh """
                    echo "Current User: $(whoami)"
                    echo "Home Directory: $HOME"
                    echo "Current Directory: $(pwd)"
                    ls -la $HOME
                """
            }
        }
        
        stage('Checkout') {
            steps {
                git credentialsId: 'github', url: 'https://github.com/harirenumanu/priyanka.git'
            }
        }
        
        stage('Deploy') {
            steps {
                withCredentials([aws(credentialsId: 'AWSCredentials')]) {
                    script {
                        // More verbose kubeconfig update
                        sh """
                            mkdir -p $HOME/.kube
                            chmod 755 $HOME/.kube
                            aws eks update-kubeconfig \
                            --name Eks-cluster \
                            --region us-east-1 \
                            --kubeconfig $HOME/.kube/config
                            
                            # Verify kubeconfig
                            ls -la $HOME/.kube
                            cat $HOME/.kube/config
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

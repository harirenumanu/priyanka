 pipeline{
    agent any
    parameters {
        string(name: 'YAML_FILE', description: 'The YAML file to be applied to the Kubernetes cluster')
    }
    stages {
  stage('checkout') {
    steps {
      git credentialsId: 'hari-github', url: 'https://github.com/harirenumanu/priyanka.git'
    }
  }
   stage('deploy') {
    steps {
        script {
            sh "aws eks update-kubeconfig --name eks-cluster --region us-east-1"
            sh "kubectl apply -f ${params.YAML_FILE}.yaml"

        }
      
    }
  }

}
 }

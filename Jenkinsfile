node {    
      def app     
      stage('Clone repository') {               
             
            checkout scm    
      }
      stage('Build image') {         
       
            app = docker.build("hrenumanu/test:v1")    
       }          
       stage('Push image') {
                                                  docker.withRegistry('https://registry.hub.docker.com', 'docker_hub') {            
       app.push("${env.BUILD_NUMBER}")            
       app.push("latest")        
              }    
           }
        }

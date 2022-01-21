pipeline{
    agent any
    tools {
        
      terraform 'terrafrom '
    }
    stages{
        
      stage('Connect to git'){
        steps{
          script{        
          git branch: 'main', credentialsId: 'mygit', url: 'https://github.com/guiassamohammed/terraform-AKS-.git'
           }
        } 
      }
      stage('Connect to azure'){
        steps{
          script{
          withCredentials([azureServicePrincipal('azureapp')]) {
                
                  }
        }
         }
      }   
      
      stage('terraform init'){
        steps{
         script{
            sh 'terraform init'
             
         }
    
            
        }  
          
          
      }
      stage('terraform apply'){
        steps{
         script{
             
             sh 'terraform apply --auto-approve'
         }    
            
            
        }  
          
      }  


      stage('Connect to the AKS server'){
       steps{
         script{ 
             sh 'az aks get-credentials -g akstest -n moaks'

         }

       }


      }


      stage('build a docker file'){
       steps{
        script{
            
            sh 'docker build -t 1993/mo60 .'

       }   
      }   


     }
     stage('connect to my docker hub'){
       steps{
        script{
             withCredentials([string(credentialsId: '19931', variable: 'dockerhubpwd')]) {
                     sh  'docker login -u 19931 -p ${dockerhubpwd}'
                   }
                   sh 'docker push 19931/mo60'
        }    
       }


     } 


     stage('deploy my app in aks'){
       steps{
         script{
              sh "kubectl apply -f ."


         } 

       }


     }
        
    }
    
    
    
}

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
        
    }
    
    
    
}

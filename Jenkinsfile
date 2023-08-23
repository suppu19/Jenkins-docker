pipeline{
    agent any
     environment {
        AWS_ACCOUNT_ID="492840825928"
        AWS_DEFAULT_REGION="ap-south-1" 
        IMAGE_REPO_NAME="niznix-ecr"
        IMAGE_TAG="latest"
        REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
    }
    stages{
        stage('Logging into AWS ECR'){
            steps{
                 sh "aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 492840825928.dkr.ecr.ap-south-1.amazonaws.com"
            }
        }     
        stage("Build the docker image"){
            steps{
                 sh "docker build -t ${IMAGE_REPO_NAME} ."
                 sh "docker tag niznix-ecr:latest 492840825928.dkr.ecr.ap-south-1.amazonaws.com/niznix-ecr:latest"
                 sh "docker push 492840825928.dkr.ecr.ap-south-1.amazonaws.com/niznix-ecr:latest"
                 sh "docker run -d -p ${BUILD_NUMBER}:80  --log-driver=awslogs --log-opt awslogs-region=ap-south-1  --log-opt awslogs-group=dockerlogs niznix-ecr:latest"
               // sh "docker run -d -p 3000:3000 --name vamsi-Adi-practice --log-driver=awslogs --log-opt awslogs-region=us-east-1 --log-opt awslogs-group=practice public.ecr.aws/g8i9m6o6/learning111:latest"
             }

           /* post {
                success {
                    slackSend color: 'good',channel: '#jenkins-intigration', message: "succesfully complited ecr :${BUILDTIMESTAMP}-${JOB_NAME}-${BUILD_NUMBER}", tokenCredentialId: 'slacklogin'
                    }            
                failure {
                    slackSend color: 'danger',channel: '#jenkins-intigration', message: "failed the build :${BUILDTIMESTAMP}-${JOB_NAME}-${BUILD_NUMBER}", tokenCredentialId: 'slacklogin'
                    }            
            }*/
        }
    }
}
    

        

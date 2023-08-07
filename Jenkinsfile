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
    }
}
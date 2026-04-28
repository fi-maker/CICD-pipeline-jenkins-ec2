pipeline {
    agent any
    environment {  // Fixed: was "Enviroment" (typo - should be lowercase 'e')
        CONTAINER_NAME = "jenkins-tier"  // Fixed: added spaces around =
        IMAGE_NAME = "jenkins-tier-image"  // Fixed: added spaces around =
        EMAIL = "faiqadnan2847@gmail.com"  // Fixed: added spaces around =
        PORT = "5000"  // Fixed: added spaces and quotes (keep as string)
    }
    stages {
        stage('Clone Repository') {  // Fixed: added quotes around stage name
            steps {
                git branch: 'mwin', url: 'https://github.com/fi-maker/CICD-pipeline-jenkins-ec2.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }
        stage('Stop & Remove Previous Container') {
            steps {
                sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                '''
            }
        }
        stage('Docker Container Run') {
            steps {
                sh '''
                    docker run -d -p ${PORT}:${PORT} --name $CONTAINER_NAME $IMAGE_NAME
                '''
            }
        }
        stage('Send Email Notification') {
            steps {
                emailext(
                    subject: "NestJS App Deployed Successfully on EC2!",
                    body: "Your Nest JS app is Deployed! http://13.62.46.106:${PORT}/",
                    to: "${EMAIL}"
                )
            }
        }
    }
}  // Fixed: removed extra closing braces (had 3, needs only 1)
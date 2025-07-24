pipeline {
    agent any

    environment {
        IMAGE_NAME = "cpp-app"
        CONTAINER_NAME = "cpp-container"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/saithejac/cicd.git'
            }
        }

        stage('Build with Bazel') {
            steps {
                sh 'bazel build //:hello_world'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Docker Run') {
            steps {
                sh '''
                docker rm -f $CONTAINER_NAME || true
                docker run -d --name $CONTAINER_NAME $IMAGE_NAME
                '''
            }
        }
    }
}

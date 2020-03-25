pipeline {
    agent any

    stages {

        stage('Build') {
            steps {
                sh 'mvn clean compile package'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn -DskipTests=false test'
            }
        }

        stage('DockerPush') {
            steps {

                sh 'aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 382026030681.dkr.ecr.ap-south-1.amazonaws.com/hello_world_repo'

                sh 'docker build --tag=hello-world-app:latest --rm=true .'
                echo 'Built docker image'
                sh 'docker tag hello-world-app:latest 382026030681.dkr.ecr.ap-south-1.amazonaws.com/hello_world_app:latest'
                sh 'docker push 382026030681.dkr.ecr.ap-south-1.amazonaws.com/hello_world_app:latest'
                echo 'Pushed to Registry'
            }
        }

        stage('DockerPush') {
            steps {
                echo 'Pushing Docker Image to registry'
                sh 'docker image ls'
            }
        }
    }
}
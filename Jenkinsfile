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

        stage('DockerBuild') {
            steps {

//                 sh 'aws ecr get-login --region ap-south-1 | docker login --username AWS --password-stdin 382026030681.dkr.ecr.ap-south-1.amazonaws.com/hello_world_repo'

                sh 'docker build --tag=hello-world-app:latest --rm=true .'
                echo 'Built docker image'
                sh 'docker tag hello-world-app:latest 382026030681.dkr.ecr.ap-south-1.amazonaws.com/hello_world_repo:latest'
            }
        }

        stage('DockerPush') {
            steps {
                sh 'docker push 382026030681.dkr.ecr.ap-south-1.amazonaws.com/hello_world_repo:latest'
                echo 'Pushed to Registry'
                sh 'docker image ls'
            }
        }
    }
}
pipeline {
    agent none

    stages {

        stage('Test') {
            agent {
                docker {
                        image 'maven:3-alpine'
                        args '-v /root/.m2:/root/.m2'
                    }
                 }
            steps {
                sh 'mvn clean compile package -DskipTests=false test'
            }
        }

        stage('DockerBuild') {
            agent {
                // Equivalent to docker build --tag=hello-world-app:latest --rm=true .'
                dockerfile {
                        filename 'Dockerfile'
                        dir '.'
                        additionalBuildArgs  '--tag=hello-world-app:latest --rm=true'
                        args '-v /tmp:/tmp'
                    }
            }
            steps {
                echo 'Built docker image'
            }
        }

        stage('DockerPush') {
            agent none
            steps {
                echo 'Pushing Docker Image to registry'
                sh 'docker ps'
            }
        }
    }
}
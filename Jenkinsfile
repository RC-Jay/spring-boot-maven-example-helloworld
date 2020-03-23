pipeline {
    agent none
    stages {

        stage('BuildnTest') {
            agent {
                docker 'maven:3-alpine'
                args '-v /root/.m2:/root/.m2'
             }
            steps {
                sh 'mvn clean compile package -DskipTests=false test'
            }
         }

        stage('DockerPush') {
            agent {
                // Equivalent to docker build --tag=hello-world-app:latest --rm=true .'
                dockerfile {
                        filename 'Dockerfile'
                        dir '.'
                        additionalBuildArgs  '--tag=hello-world-app:latest --rm=true'
                    }
            }
            steps {
                echo 'Built docker image'
                sh 'docker ps'
            }
        }
    }
}
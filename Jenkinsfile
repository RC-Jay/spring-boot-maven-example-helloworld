pipeline {

    stages {
        stage('DockerPush') {
            agent {
                // Equivalent to docker build --tag=hello-world-app:latest --rm=true .'
                dockerfile {
                        filename 'Dockerfile'
                        dir '.'
                        additionalBuildArgs  '--no-cache --tag=hello-world-app:latest --rm=true'
                        args '-v /tmp:/tmp'
                    }
            }
            steps {
                echo 'Built docker image'
            }
        }
        stage('Test') {
            agent {
                docker {
                        image 'maven:3-alpine'
                        args '-v /root/.m2:/root/.m2'
                    }
            steps {
                sh 'mvn clean compile package -DskipTests=false test'
          }
        }
    }
}
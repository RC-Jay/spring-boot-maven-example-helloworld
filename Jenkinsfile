pipeline {
    agent none

    stages {

        stage('Build') {
            agent {
                // Equivalent to docker build --tag=hello-world-app:latest --rm=true .'
                dockerfile {
                        filename 'Dockerfile'
                        dir '.'
                        additionalBuildArgs  '--tag=hello-world-app:latest --rm=true'
                        args '-v /root/.m2:/root/.m2'
                    }
            }
            steps {
                echo 'Built docker image'
            }
        }

        stage('Test') {
            agent { docker 'maven:3-alpine' }
            steps {
                sh 'mvn -DskipTests=false test'
          }
        }
    }
}
pipeline {
    agent none

    stages {

        stage('Build') {
            agent {
                docker {
                        image 'maven:3-alpine'
                        args '-v /root/.m2:/root/.m2'
                    }
            steps {
                sh 'mvn clean compile package -DskipTests=false test'
          }
        }

        stage('Build') {
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
    }
}
}
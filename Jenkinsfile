pipeline {
    agent {
        // Equivalent to docker build --tag=hello-world-app:latest --rm=true .'
        dockerfile {
                filename 'Dockerfile'
                dir '.'
                additionalBuildArgs  '--tag=hello-world-app:latest --rm=true'
                args '-v /tmp:/tmp'
            }
    }
    stages {
        stage('DockerPush') {
            steps {
                echo 'Built docker image'
            }
        }
        stage('Test') {
            steps {
            sh 'mvn clean compile package -DskipTests=false test'
          }
        }
    }
}
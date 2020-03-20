pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            args '-v /root/.m2:/root/.m2'
        }
    }
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
                sh 'docker build --tag=hello-world-app:latest --rm=true .'
//                 Push to Docker registry here
            }
        }
        stage('KubeDeploy') {
            steps {
//             Deploy to Kube
          }
        }
    }
}
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
            echo 'Starting Build'
                sh 'mvn clean compile package'
            }
        }
        stage('Test') {
            steps {
                echo 'Running Unit Tests'
                sh 'mvn -DskipTests=false test'
            }
        }
        stage('DockerPush') {
        agent none
            steps {
                echo 'Starting to build docker image'
                sh 'docker build --tag=hello-world-app:latest --rm=true .'
            }
        }
//         stage('KubeDeploy') {
//             steps {
// //             Deploy to Kube
//           }
//         }
    }
}
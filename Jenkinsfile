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
            steps {
                echo 'Starting to build docker image'
                script {
                    def dockerImage = docker.build("ReleaseImage:${env.BUILD_ID}")
    //                 dockerImage.push()
                }
            }
        }
//         stage('KubeDeploy') {
//             steps {
// //             Deploy to Kube
//           }
//         }
    }
}
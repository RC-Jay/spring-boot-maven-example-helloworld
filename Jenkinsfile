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
            agent {
                // Equivalent to "docker build -f Dockerfile .
                dockerfile {
                    filename 'Dockerfile'
                    dir '.'
                    label 'DockerPushLabel'
                    additionalBuildArgs  '--tag=hello-world-app:latest --rm=true'
                    args '-v /tmp:/tmp'
                }
            }
            steps {
                echo 'Built docker image'
//                 sh 'docker build --tag=hello-world-app:latest --rm=true .'
            }
        }
//         stage('KubeDeploy') {
//             steps {
// //             Deploy to Kube
//           }
//         }
    }
}
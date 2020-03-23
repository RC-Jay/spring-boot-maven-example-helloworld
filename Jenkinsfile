pipeline {
    agent {
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
    //                 sh 'docker build --tag=hello-world-app:latest --rm=true .'
            }
        }
//         stage('KubeDeploy') {
//             steps {
//             Deploy to Kube
//           }
//         }
    }
}
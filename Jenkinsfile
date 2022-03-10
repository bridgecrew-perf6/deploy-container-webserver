pipeline{
    agent any
    stages
    {
        stage ("checkout from scm")
        {
            steps
            {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/yakhub4881/deploy-container-webserver.git']]])
            }
        }
        stage ("build docker image")
        {
            steps{
                sh 'docker build -t myimage:v1.$BUILD_ID .'
            }
        }
        stage ("push image to docker hub")
        {
            steps{
                withCredentials([string(credentialsId: 'DockerPasswdd', variable: 'DockerPasswdd')]) {
                sh "docker login -u yakhub4881 -p ${DockerPasswd}"
                sh 'docker tag myimage:v1.$BUILD_ID yakhub4881/myimage:v1.$BUILD_ID'
                sh 'docker tag myimage:v1.$BUILD_ID yakhub4881/myimage:latest'
                }
            }
        }
        stage ("Deploy container on webapp server")
        {
            steps{
                sshagent(['deploy-container-webserver']) {
                sh 'ssh -o StrictHostKeyChecking=no centos@13.232.125.70 docker run -itd --name webappcontainer -p 3000:80 yakhub4881/myimage'
                 }
            }
        }
    }
}
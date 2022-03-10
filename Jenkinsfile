pipeline{
    agent any
    stages
    {
        stage ("checkout from scm")
        {
            steps
            {
                checkout([$class: 'GitSCM', branches: [[name: 'main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/yakhub4881/deploy-container-webserver.git']]])
            }
        }
        stage ("build docker image")
        {
            steps{
                sh 'docker build -t myimage:v1.$BUILD_ID'
            }
        }
    }
}
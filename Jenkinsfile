pipeline {
    agent any
    tools {
        maven 'Maven-3.8.7'
    }

    stages {
        stage('Source') {
            steps {
               sh 'mvn --version'
               sh 'git --version'
               git branch: 'main',
                   url: 'https://github.com/Agarchuk/hello-world.git'
               sh 'mvn clean install'
            }
        }
        stage('Build') {
            steps {
                echo "${env.BUILD_ID}"
                script{
                    sh "docker build -t agarchuk/hello-world:${env.BUILD_ID} ."
                    sh "docker push agarchuk/hello-world:${env.BUILD_ID}"
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing....'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                kubernetesDeploy (configs: 'k8s.yaml', kubeconfigId: 'k8sconfig')
            }
        }
    }
}
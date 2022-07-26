pipeline {
    agent none 
    stages {
        stage('build') {
		   agent {
		     docker { 
                image 'maven:3.8.4-openjdk-11-slim' 
                args '-v /tmp:/tmp'
                }
              steps {
                git 'https://github.com/pranay142/hello-world-1.git'
                sh 'mvn --version'
                sh 'mvn clean install'
                }
			}
        }
    }
}

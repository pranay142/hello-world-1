pipeline {
    agent none
    stages {
        stage('build') {
		    agent { 
                docker { 
                    image 'maven:3.8.4-openjdk-11-slim' 
                }
            }
            steps {
                git 'https://github.com/pranay142/hello-world-1.git'
                sh 'mvn --version'
                sh 'mvn clean install'
            }
        }
		stage('Bake') {
		    agent { dockerfile { additionalBuildArgs '-t mytag:$BUILD_NUMBER' } }
			steps {
			    echo 'ls -l'
			}
		}
		stage('Verify') {
		    agent any
			steps {
			  sh 'docker image ls'
			}
		}
		stage('Deploy') {
		    agent any
			steps {
			  input(
			    message: 'Ready to deploy?',
				ok: 'Yes'
			  )
			  sh 'docker container run -itd -p 8081:8080 mytag:$BUILD_NUMBER'
			}
		}
    }
}

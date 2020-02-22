pipeline {
    agent any
    stages {
                stage ('Build') {
                steps {
                    sh 'docker ps'
                    sh 'docker build -t erzez/api_erez:test .'
                    sh 'docker push erzez/api_erez:test'
                    sh 'docker run --name test -p 80:80 -dit erzez/api_erez:test'
                    }
                }
                stage ('Test') {
                steps {
                    sh 'set var = ${./test.sh}'
                        echo $var
                    }
                }
                stage('Deploy') {
                when { expression { return $var }
                }
                steps {
                sh 'docker rm -f test'
                sh 'docker rmi erzez/api_erez:test'
                sh 'docker run --name prod -p 80:80 -dit erzez/api_erez:test'
                }
            }          
        }
}

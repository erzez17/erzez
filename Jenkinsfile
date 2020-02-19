pipeline {
    agent any
    stages {
                stage ('Build') {
                steps {
                    sh 'docker build -t test:1 .'
                    }
                }
                stage ('Test') {
                       steps {
                            sh 'set var = ${./test.sh}'
                            echo $var
                }
                stage('Deploy') {
                when { expression { return $var }
              }
            }
            steps {
                sh 'docker rm -f erz'
                sh 'docker rmi erzez/api_erez:1'
                sh 'docker rmi test:1'
                sh 'docker build -t erzez/api_erez:1'
                sh 'docker run --name erz -p 80:80 -dit erzez/api_erez:1'
            }
        }
    }
}

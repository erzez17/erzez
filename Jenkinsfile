pipeline {
  agent {
    docker {
      image 'erzez/ap_erez:1'
      args '-p 80:80'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh 'npm install'
      }
    }

  }
}
node {
	stage("Build") {
		deleteDir()
		checkout scm
		sh 'docker build -t erez:test .'
		sh 'docker tag erez:test erzez/api_erez:test'
		sh 'docker run --name test -p 80:80 -dit erzez/api_erez:test'
	}
	stage ("Test") {
		def var = sh(script: './test.sh', returnStdout: true)
	}
	stage ("Deploy") {
		if ($var = 'true')
		{
			sh 'docker rm -f test'
                	sh 'docker rmi erzez/api_erez:test'
			sh 'docker build -t erzez/erez:prod'
	                sh 'docker run --name prod -p 80:80 -dit erzez/api_erez:test'
		}
		else
		{
			echo 'Not working'
		}
	}	
}

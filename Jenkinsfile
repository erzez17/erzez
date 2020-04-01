node {
	stage("Build") {
		deleteDir()
		checkout scm
		sh 'docker build -t erzez/api_test:latest'
	}
	stage("Test") {
		sh 'docker run --name test -p 80:80 -dit erzez/api_test:latest'
		sh 'sudo chmod +x test.sh'
		def var = sh (script: "./test.sh", returnStdout: true)
		sh 'docker rm -f test'
		if ("${var}") {
			echo "Testing completed successfully!"
		}
		else {
			echo "Failed The Testing"
			currentBuild.result = 'FAILURE'
		}
	}
	stage ("Deploy") {
		sh 'docker build -t erzez/api_prod:latest'
		sh 'docker push erzez/api_prod:latest'
		sh 'docker rm -f prod'
		sh 'docker run --name prod -p 80:80 -dit erzez/api_prod:latest'
	}
}


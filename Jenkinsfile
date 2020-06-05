node {

	API_ENDPOINT="localhost:80" // insert relevant api endpoint

	stage("Build") {
		deleteDir()
		checkout scm
		// build image with version tag and push

		withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId:'DockerHub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
		sh """
		docker build -t erzez/api_test:${BUILD_NUMBER} .
        docker login --username $USERNAME --password $PASSWORD
		docker push erzez/api_test:${BUILD_NUMBER}
		"""
        }
	}
	stage("Test") {
		sh """
		sed \"s/@VERSION/${BUILD_NUMBER}/g\" manifests/deployments/api-deployment.yaml > deploy.yaml

		kubectl apply -f deploy.yaml --namespace dev
		"""

		sh 'chmod +x test.sh'
		def var = sh (script: "./test.sh ${API_ENDPOINT}", returnStdout: true)

		sh 'kubectl delete -f deploy.yaml'

		if ("${var}") {
			echo "Testing completed successfully!"
		}
		else {
			echo "Failed The Testing"
			currentBuild.result = 'FAILURE'
		}
	}
	stage ("Deploy") {
		sh 'kubectl apply -f deploy.yaml --namespace prod'
	}
}


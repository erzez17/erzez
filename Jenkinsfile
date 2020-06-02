node {

	API_ENDPOINT="http://1.1.1.1:3000" // insert relevant api endpoint

	stage("Build") {
		deleteDir()
		checkout scm
		// build image with version tag and push
		sh """ 
		docker build -t erzez/api_test:${BUILD_NUMBER}
		
		docker login erzez --username ? --password ?

		docker push erzez/api_test:${BUILD_NUMBER}
		"""
	}
	stage("Test") {
		sh """
		sed \"s/@VERSION/${BUILD_NUMBER}/g\" manifests/deployments/api-deployment.yaml > deploy.yaml

		kubectl apply -f deploy.yaml --namespace dev
		"""

		sh 'chmod +x test.sh ${API_ENDPOINT}'
		def var = sh (script: "./test.sh", returnStdout: true)

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


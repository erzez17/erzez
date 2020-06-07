node {

	API_ENDPOINT="kube-lb-990898097.eu-central-1.elb.amazonaws.com" // insert relevant api endpoint

	stage("Build") {
		deleteDir()
		checkout scm
		// build image with version tag and push

		withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId:'DockerHub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
		sh """
		sudo chmod 777 /var/run/docker.sock
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
		chmod +x test.sh

		sleep 30

        """

		sh "./test.sh ${API_ENDPOINT}"

		echo "Testing completed successfully!"
		
	}
	stage ("Deploy") {
		sh 'kubectl apply -f deploy.yaml --namespace prod'
	}
}
node {
    try {
        //notifyBuild('STARTED')
        def t11  = tool 'terraform'

        sh "cp ${t11}/terraform ./"

        stage("Datafile Checkout: ${talendEnvPath}") {
          git credentialsId: '540cb727-ad71-40fd-9b05-3001546e0448', url: 'https://github.com/keerthi-penmatsa/terraform-jenkins-cucumber.git', branch: params.branch 
        	}
	}
}

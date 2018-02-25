node {
            //notifyBuild('STARTED')
        def t11  = tool 'terraform'
        def t12  = tool 'terraform'

        sh "cp ${t11}/terraform ./"
        stage("Datafile Checkout: ${talendEnvPath}") {
          git credentialsId: '540cb727-ad71-40fd-9b05-3001546e0448', url: 'https://github.com/keerthi-penmatsa/terraform-jenkins-cucumber.git', branch: params.branch 
        	}
	withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws_creds', defaultRegion: 'us-east-1']]) {
            ansiColor('xterm') {
		dir('dev-poc'){	    
			//Set Datafile Vars
			datafile = "./applications/datafiles/${talendEnvPath}.tfvars"
		    	talendEnv = params.talendEnvPath?.toUpperCase()
			
			sh "./applications/terraform init -reconfigure=true"
                    	sh "./applications/terraform get -update=true"
		
		    	if(params.tfPlan){    
                        stage("Infra Template (tfPlan)"){
                            sh "./applications/terraform plan -var-file=${datafile}"
                        	}
                    	}
		}
	    }
	}
	
}

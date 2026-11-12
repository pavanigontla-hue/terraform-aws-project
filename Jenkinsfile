
pipeline {
    agent any

    stages {

        stage('Check Terraform') {
            steps {
                echo 'Checking Terraform installation'
                bat 'terraform -version'
            }
        }

        stage('Terraform Format Check') {
            steps {
                echo 'Checking Terraform formatting'
                bat 'terraform fmt -check -recursive'
            }
        }

        stage('Terraform Initialize') {
            steps {
                echo 'Initializing Terraform without configuring remote backend'
                bat 'terraform init -backend=false -input=false'
            }
        }

        stage('Terraform Validate') {
            steps {
                echo 'Validating Terraform configuration'
                bat 'terraform validate'
            }
        }
    }

    post {
        success {
            echo 'SUCCESS: Terraform validation completed!'
        }

        failure {
            echo 'FAILED: Please check the Jenkins Console Output.'
        }
    }
}

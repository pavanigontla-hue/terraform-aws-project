
pipeline {
    agent any

    stages {

        stage('Check Terraform') {
            steps {
                echo 'Checking Terraform installation'
                bat 'terraform -version'
            }
        }

        stage('Verify AWS Connection') {
            steps {
                echo 'Verifying AWS credentials'

                withCredentials([
                    usernamePassword(
                        credentialsId: 'aws-terraform-credentials',
                        usernameVariable: 'AWS_ACCESS_KEY_ID',
                        passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                    )
                ]) {
                    withEnv(['AWS_DEFAULT_REGION=ap-south-1']) {
                        bat 'aws sts get-caller-identity'
                    }
                }
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
                echo 'Initializing Terraform'
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
            echo 'SUCCESS: AWS and Terraform verification completed!'
        }

        failure {
            echo 'FAILED: Please check the Jenkins Console Output.'
        }
    }
}

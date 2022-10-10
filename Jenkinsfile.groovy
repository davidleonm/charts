@Library('shared-library') _
import com.davidleonm.GlobalVariables

pipeline {
    agent { label 'helm-slave' }
    
    environment {
        HELM_PACKAGE_PATH='/mnt/helms/'
    }
    
    stages {
        stage('Creating Helm charts') {
            steps {
                script {
                    sh 'for folder in ./*/ do helm package $folder'
                }
            }
        }
        
        stage('Moving charts to server') {
            steps {
                script {
                    sh """
                       for package in ./*.tgz
                       do
                           mv package HELM_PACKAGE_PATH
                       done
                       """
                }
            }
        }
    }
    post {
        always {
            script {
                echo 'Cleaning package files'
                sh 'rm -rf *.tgz'
            }
        }
    }
}

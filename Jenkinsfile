pipeline {
    agent any
    
 
    stages {
        stage('Cleanup'){
            steps{
                deleteDir()
            }
        }
        
        stage('Checkout'){
            steps {
                sh "git clone https://Github.com/marina-abr/bootcampact"
                  }
        }
        stage('Build: Prepare App Dependencies'){
            steps{
                dir("bootcampact/api"){
                    sh 'npm prune --production'
                }
            }
        }
        stage('Terraform init'){
            steps {
                dir("bootcampact/setup/terraform/test"){
                    sh 'terraform init'
                }
            }
        }
        stage('Terraform apply') {
            steps {
                dir("bootcampact/setup/terraform/test"){
                    sh 'terraform apply --auto-approve'
                }
            }
        }
        stage('Deploy: Prepare TF Outputs for Reuse'){
            steps{
                dir("bootcampact/setup/terraform/test"){
                    sh 'mkdir outputs'
                    sh 'terraform output -raw resource_group_name > ./outputs/rgName.txt'
                    sh 'terraform output -raw sa_name > ./outputs/saName.txt'
                    sh 'terraform output -raw asp_name > ./outputs/aspName.txt'
                    sh 'terraform output -raw fa_name > ./outputs/faName.txt'
                    sh 'terraform output -raw fa_url > ./outputs/fa_url.txt'
                }
            }
        }
        stage('Deploy: Publish App to Azure') {
            steps {
                dir("bootcampact/setup/terraform/test/outputs"){
                    sh '''
                    rgname=`cat rgName.txt`
                    faname=`cat faName.txt`
                    cd ../../../../api
                    func azure functionapp publish $faname -b remote --javascript
                    '''
                }
            }
        }
        stage('Test: Run Bruno API Tests') {
            steps {
                dir("bootcampact/test/PROD"){
                    sh '''
                    faurl=`cat ../../setup/terraform/test/outputs/fa_url.txt`
                    printf "vars:pre-request {\\n  URL: $faurl \\n}" > collection.bru
                    '''
                    sh 'bru run --reporter-html results.html'
                    archiveArtifacts artifacts: 'results.html', fingerprint: true
                }
            }
        }

    }
}
pipelien {
    agent {
        node ('JENKINS_SLAVE && JENKINS_USER')
    }
    triggers{
        cron('00 00 * * 1')
    }
    environment { EMAIL_RECIPIENTS="19140873@qq.com,xms19911227@sina.com"
        SENDER="jenkins"
        CONTENT=sh(script:"chmod +x -R ${env.WORKSPACE}; bash ./test.sh", returnStdout: true).trim()
    }

    stages {
        stage('send_email'){
            steps{
                script{
                    emailext body: "${CONTENT}",
                    subject: "ceshi jenkins",
                        to: "${EMAIL_RECIPIENTS}", from: "${SENDER}"
                }
            }
        }
        stage('update_repo'){
            steps{
                script{
                    withCredentials([gitUsernamePassword(credentialsId: 'SA_YP', gitToolName: 'git-tool')]) {
                      sh (script: """
                      git add -A .
                      git commit -m "roll"
                      git status
                      git checkout -b main
                      git push origin main:main
                        """
                      )
                    }
                }
            }

        }
    }
    post {
        cleanup {
            deleteDir()
        }
    }

}
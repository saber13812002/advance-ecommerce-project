pipeline{
    agent any
    environment{
        OWNER = "behaminplus"
        PROJECT_NAME = env.JOB_NAME.minus("/${env.JOB_BASE_NAME}").minus("${OWNER}/");
        LOG_OUTPUT_URL = "${BUILD_URL}display/redirect";
    }

    stages{
        stage('deploy'){
            steps{
                ansiblePlaybook(
                installation: 'ansible',
                credentialsId: 'cm-sa',
                extraVars: [branch: '$GIT_BRANCH',project: '$PROJECT_NAME', organization: '${OWNER}', SH_ST: "yes", SH_AS: "yes"],
                inventory: '/home/cm-sa/behaminplus.ir/cloud/inventories/inventory.ini',
                playbook: '/home/cm-sa/behaminplus.ir/cloud/playbooks/deploy.yaml')
            }
        }
    }

    post{
        success{
            mattermostSend color: 'good', message: "$LOG_OUTPUT_URL", text: "job #$BUILD_NUMBER $GIT_BRANCH@$PROJECT_NAME succeed"
        }

        failure{
            mattermostSend color: 'danger', message: "$LOG_OUTPUT_URL", text: "job #$BUILD_NUMBER $GIT_BRANCH@$PROJECT_NAME failed"
        }
    }
}

import jenkins.model.*
import hudson.slaves.*
import hudson.model.Node.Mode
import java.util.logging.Logger

def logger = Logger.getLogger("init.groovy.d.agent-node")
def instance = Jenkins.getInstance()

def agentName = System.getenv('JENKINS_AGENT_NAME') ?: 'agent-1'
def agentSecret = System.getenv('JENKINS_SECRET') ?: ''
def agentWorkDir = System.getenv('JENKINS_AGENT_WORKDIR') ?: '/home/jenkins/agent'
def jenkinsUrl = System.getenv('JENKINS_URL') ?: 'http://jenkins-master:8080'

def existing = instance.getNode(agentName)
if (existing == null) {
    def launcher = new JNLPLauncher(false)
    def agent = new DumbSlave(
        agentName,
        "Automated agent node",
        agentWorkDir,
        "1",
        Mode.NORMAL,
        "",
        launcher,
        new RetentionStrategy.Always(),
        []
    )
    instance.addNode(agent)
    logger.info("Agent node '${agentName}' created.")
} else {
    logger.info("Agent node '${agentName}' already exists.")
}

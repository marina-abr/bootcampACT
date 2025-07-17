import jenkins.model.*
import hudson.security.*

def instance = Jenkins.getInstance()
// Read admin credentials from environment variables, fallback to 'admin' if not set
def adminUser = System.getenv('ADMIN_USER') ?: 'admin'
def adminPassword = System.getenv('ADMIN_PASSWORD') ?: 'admin'
// Set up local user database with admin user if not already present
def hudsonRealm = instance.getSecurityRealm()
if (!(hudsonRealm instanceof HudsonPrivateSecurityRealm)) {
    hudsonRealm = new HudsonPrivateSecurityRealm(false)
    hudsonRealm.createAccount(adminUser, adminPassword)
    instance.setSecurityRealm(hudsonRealm)
    instance.save()
}

// Enforce login: no anonymous read, only authenticated users can access
import java.util.logging.Logger
def logger = Logger.getLogger("init.groovy.d.basic-security")
def strategy = new GlobalMatrixAuthorizationStrategy()
// Grant all permissions to admin user
strategy.add(Jenkins.ADMINISTER, adminUser)
// Do not grant any permissions to 'anonymous' (no access)
instance.setAuthorizationStrategy(strategy)
instance.save()
// Set Jenkins root URL from environment variable, fallback to default
def location = jenkins.model.JenkinsLocationConfiguration.get()
def jenkinsUrl = System.getenv('ADMIN_JENKINS_URL') ?: 'http://localhost:8080/'
location.setUrl(jenkinsUrl)
location.save()
// Set built-in (master) node to 0 executors to disable builds on controller
def node = instance.getNode("master") ?: instance
node.setNumExecutors(0)
instance.save()
logger.info("Security configured: login required, only admin has access. Jenkins URL set. Master node executors set to 0.")

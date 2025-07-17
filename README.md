## 🚀 **Bootcamp Challenge: “From Code to Cloud – DevOps in Action”**

### 🧠 **Scenario**
Your team has been hired by a startup that built a small backend service fetching data from the Pokémon API. They want to modernize their development and deployment process using DevOps best practices. Your mission: build a complete CI/CD pipeline with testing, monitoring, and cloud deployment using modern tools.

---

## 🗓️ **5-Day Timeline**

### **🟢 Day 1 – Kickoff & Infrastructure Setup**

#### **Morning: Task Presentation & Team Planning**
- Introduction to the challenge
- Tool overview and team formation
- Architecture brainstorming and role assignment

#### **Afternoon: Local Infrastructure Setup**
- Use WSL2
- Use **Ansible** to:
  - install jre and terraform and run jenkins agent
- Set up shared GitHub repo and project board

---

### **🟡 Day 2 – CI & Testing**

#### **Morning: App Setup & Testing**
- run backend app
- Write **Bruno** API tests
- Add **Dependabot** to GitHub for Maven dependency updates

#### **Afternoon: GitHub Actions CI**
- Create a **GitHub Actions workflow** to:
  - Build the app with Maven
  - Run unit tests and Bruno API tests
- Ensure test results are visible in PRs

---

### **🟠 Day 3 – Monitoring & Observability**

#### **Morning: Jenkins Setup**
- Deploy **Jenkins** in Docker compose
- Configure Jenkins for **manual deployments only**
- Add Prometheus metrics endpoint to Jenkins

#### **Afternoon: Monitoring Stack**
- Deploy **Prometheus**, **Grafana** in compose
- Configure Prometheus to scrape:
  - Jenkins metrics
- Build Grafana dashboards for Jenkins and app containers
- Use **Portainer** to inspect services and logs

---

### **🔵 Day 4 – Cloud Deployment**

#### **Morning: Azure Infrastructure with Terraform**
- Write **Terraform scripts** to:
  - Create an **Azure Function App** with **dev and prod slots**
  - Enable **Application Insights**
  - Set environment variables (e.g., API keys, instrumentation keys)

#### **Afternoon: Jenkins Deployment Pipeline**
- Extend Jenkins to:
  - Deploy to **dev slot** on manual trigger
  - Run post-deploy tests (optional)
  - Deploy to **prod slot** on approval
- Confirm both slots are accessible via HTTP
- Verify Application Insights is collecting telemetry

---

### **🟣 Day 5 – Finalization & Presentation**

#### **Morning: Polish & Document**
- Finalize:
  - GitHub repo structure
  - Jenkinsfile
  - Terraform and Ansible scripts
  - Grafana dashboards
- Write a short README and architecture overview

#### **Afternoon: Team Presentations**
- Each team presents:
  - Architecture and toolchain
  - CI/CD pipeline demo
  - Monitoring dashboards
  - Lessons learned and challenges

---

## 🧰 **Toolchain Summary**

| Tool | Purpose |
|------|---------|
| **GitHub** | Source control, PRs |
| **GitHub Actions** | CI: build, test, validate |
| **Dependabot** | Maven dependency updates |
| **Bruno** | API testing |
| **Jenkins** | Manual deployment to Azure |
| **Terraform** | Azure Function + slots + App Insights |
| **Azure Functions** | Serverless backend |
| **Application Insights** | App telemetry |
| **Ansible** | VM provisioning, Docker, Swarm setup |
| **Docker Swarm** | Local orchestration |
| **Prometheus + Grafana** | Monitoring |
| **Portainer** | Visual Swarm management |


---

- scoop install nodejs-lts azure-functions-core-tools vagrant vscode terraform bruno
- Docker Desktop (WSL2)

wsl --install -d Ubuntu (username und password vergeben)  --> wsl -d Ubuntu
sudo apt update
sudo apt install ansible -y

https://github.com/jenkinsci/docker/blob/master/README.md#usage-1

ansible-playbook -i inventory.ini jenkins-setup.yml -K

curl -sO http://localhost:8080/jnlpJars/agent.jar
java -jar agent.jar -url http://localhost:8080/ -secret cfd885525107af272f59d56b42170598789da7f66af8bd9a6e1f9caef7975bbc -name "agent-1" -webSocket 


# Challenge

## Basic Team Setup
- build teams
- understand the challenge
- talk about roles
- create a team github repository with everyone having access (fork basic setup)
- get to know the app
  - install deps
  - run the test locally
    - play with it
- basic CI/CD
  - add github action that runs the tests of the app on every PR
  - reject PRs only if build works
  - add dependabot to automatically check for NPM updates and let it automatically create PRs
- tests
  - try running the app as an Azure Funtion locally (azure-functions-core-tools)
  - write api tests with bruno 1-2, e.g. for pikachu and charmander
  - run them locally with ui
  - run them locally wheadless over CLI
  - add the test to the github action (approve only if success)
- Container-/Hybrid-Setup
  - run Jenkins with Docker Compose (with multiple replicas aka resilience)
  - setup jenkins master automatically as much as you see feasable (eg. automatically add default admin user and install default plugins without user interaction)
  - secrets should not be hard coded (hint: .env file)
  - unauthorized users shall have no access
- Node setup:
  - create an anible playbook for node installation (so that required tools are present: JRE and Terraform)
  - in jenkins master add a new node
  - setup jenkins not not run any tasks on master node, only on new node
  - on your host machine get an ubuntu running with WSL2 (like a VM)
    - login to this WSL instance
    - install ansible to it
    - run your ansible playbook
    - connect to jenkins master as newly created node
Observability:
  - add portainer to your docker compose and get used to it (this is your "cluster" dashboard)
  - add prometheus plugin to jenkins
    - check if you see metrics
  - add prometheus to your docker compose
    - configure prometheus to scrape jenkins master and agent metrics
  - add grafana to your compose
    - display metrics collected by prometheus
Deployment/Cloud:
  - get an Azure account
    - deploy the function manually ad try accessing it  with your browser over internet 
  - add a jenkins job to deploy the app as an Azure Function (serverless) with manual trigger only
    - get latest git commit
    - use terraform to deploy a new function
    - try accessing it from jenkins pipeline (e.g. with curl) and report status
  - add jenkins job to delete the Azure Function again
    - terraform of course
  - add possibility to add/delete a prod and a dev version of your azure function with the same 2 jobs (make add and delete configurable)
    - in azure use deployment slots for different environments
Cloud Insights:
  - when creating the function also add application insights and and see logs and graphs

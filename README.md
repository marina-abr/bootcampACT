## 🧪 **Use Case: PokéDelivery – Serverless Food für Pokémon**

Stell dir vor, du arbeitest im Team von **PokéDelivery**, einem innovativen Start-up, das Pokémon in ganz Kanto mit frischem Sushi beliefert: natürlich serverless, resilient und CI/CD-ready. Doch um eure potentiellen Kunden besser kennenzulernen (Pikachu liebt Lachs!), braucht ihr erst einmal mehr Daten über sie. Ihr gehört zu dem Team, das eine App zur Datenbeschaffung bereitstellen soll (Das Dev Team hat eine Entwicklerversion bereits für euch zur Verfügung gestellt). Eure Aufgabe: Eine Plattform erstellen, mit der ihr Informationen über Pokemons abrufen könnt, mit einem Hauch von DevOps-Magie.

---

## 🗓️ **Bootcamp Agenda (5 Tage)**

### Teamaufbau & App kennenlernen
**Ziel:** Zusammenarbeit etablieren, App verstehen und lokal zum Laufen bringen.

- 👥 **Team & Rollen**
  - Überlegt euch, wie ihr zusammenarbeiten wollt
  - Basis-Repository forken & Zugriff für alle einrichten

- 🧩 **App Setup**
  - Repo klonen, Abhängigkeiten installieren (siehe api/README.md)
  - Tests der App lokal ausführen
  - Funktionen erkunden

- 🔁 **CI/CD Basics**
  - GitHub Action: Tests bei jedem PR ausführen
  - PRs ablehnen, wenn Tests fehlschlagen
  - Dependabot aktivieren für automatische NPM-Updates

### Testen & Azure Function lokal
**Ziel:** App testen und lokal als Azure Function betreiben.

- ⚙️ **Azure Function lokal**
  - `azure-functions-core-tools` installieren
  - App lokal als Azure Function starten

- 🧪 **API-Tests mit Bruno**
  - Bruno: 
  - 1–2 Tests schreiben (z. B. für Pikachu & Glumanda)
  - Tests per UI & CLI (headless) ausführen
  - Tests in GitHub Action integrieren (PR nur bei Erfolg zulassen)

### Jenkins & Containerisierung
**Ziel:** Jenkins resilient & sicher in Docker betreiben.

- 🐳 **Jenkins mit Docker Compose**
  - Jenkins mit mehreren Replikas starten
  - Automatische Konfiguration: Admin-User, Plugins
  - Keine Secrests im Repository ablegen (beispielsweise über `.env`)
  - Kein Zugriff für anonyme Nutzer:innen erlauben

- 🧰 **Node Setup mit Ansible**
  - WSL2-Ubuntu lokal einrichten
  - Ansible-Playbook: JRE & Terraform installieren
  - Agent mit Jenkins verbinden
  - Jenkins so konfigurieren, dass nur der Agent Jobs ausführt, der Master darf keine starten
  - erstelle einen "Hello World" Job und überprüfe ob alles funktioniert
  - verbindet mehrere PCs eures Teams mit demselben Jenkins-Master

### Observability & Monitoring
**Ziel:** Logs & Metriken sichtbar machen.

- 📦 **Portainer**
  - In Docker Compose integrieren
  - Jenkins-Logs & Containerstatus einsehen

- 📊 **Prometheus & Grafana**
  - Prometheus in Compose integrieren
  - Prometheus-Plugin in Jenkins installieren
  - Jenkins-Metriken scrapen
  - Grafana-Dashboard für Metriken erstellen
  - Logs von Prometheus & Grafana in Portainer prüfen

### Deployment & Cloud Monitoring
**Ziel:** App in Azure deployen & überwachen.

- ☁️ **Azure Setup**
  - Azure-Konto erstellen (auf https://portal.azure.com/#home)
  - Startet einen `Azure Free Trial` (200$ inklusive)
  - Funktion manuell deployen (Azure Function App, Wes Europa) & im Browser testen
  - wenn alles funktioniert, wieder aufräumen/löschen

- 🚀 **Jenkins Deployment Jobs**
  - Job: Azure Function via Terraform deployen (Achtung: State File)
    - Letzten Git-Commit verwenden
    - Endpoint mit `curl` testen und status an Jenkins zurückmelden
  - Job: Azure Function löschen anlegen (auch Terraform)

- 🧪 **Umgebungen verwalten**
  - Deployment-Slots für `dev` & `prod` nutzen (für die Function App)
  - Deploy/Delete-Jobs konfigurierbar machen für die Umgebungen

- 🔍 **Application Insights**
  - Beim Deployment aktivieren
  - Logs & Graphen in Azure Portal prüfen


---

## Wissenswertes

### Videos

| 🎥 **Kursname**                                                       | 🔗 **URL**                                                                                   | 🎯 **Fokus im Bootcamp**                                      |
|----------------------------------------------------------------------|----------------------------------------------------------------------------------------------|---------------------------------------------------------------|
| GitHub Actions – The Complete Guide                                  | https://capgemini.udemy.com/course/github-actions-the-complete-guide/ | Git-Crashkurs, Basics, Events                                 |
| AZ-900: Microsoft Azure Fundamentals                                 | https://capgemini.udemy.com/course/az900-azure/ | gern komplett, Fokus auf Allgemeines Verständnis, Compute & Storage                    |
| Jenkins Masterclass                                                  | https://capgemini.udemy.com/course/jenkins-masterclass/ | Komplett durchgehen                                           |
| Learn Ansible                                                        | https://capgemini.udemy.com/course/learn-ansible/ | Komplett durchgehen                                           |
| Terraform for the Absolute Beginners                                 | https://capgemini.udemy.com/course/terraform-for-the-absolute-beginners/ | Komplett durchgehen                                           |
| Learn Docker                                                         | https://capgemini.udemy.com/course/learn-docker/ | komplett                                      |
| Dive into Cloud Native: Containers, Kubernetes & KCNA                | https://capgemini.udemy.com/course/dive-into-cloud-native-containers-kubernetes-and-the-kcna/ | Ohne Docker; Kubernetes empfohlen     |

### Weitere Informationen:

| 🛠️ **Tool**                        | 🔗 **Offizielle Dokumentation / Info**                                                                 |
|------------------------------------|--------------------------------------------------------------------------------------------------------|
| **GitHub Actions**                 | [https://docs.github.com/en/actions](https://docs.github.com/en/actions)                              |
| **Dependabot**                     | [https://docs.github.com/en/code-security/supply-chain-security/keeping-your-dependencies-updated-automatically](https://docs.github.com/en/code-security/supply-chain-security/keeping-your-dependencies-updated-automatically) |
| **Azure Functions**                | [https://learn.microsoft.com/en-us/azure/azure-functions/](https://learn.microsoft.com/en-us/azure/azure-functions/) |
| **Azure Functions Core Tools**     | [https://learn.microsoft.com/en-us/azure/azure-functions/functions-run-local](https://learn.microsoft.com/en-us/azure/azure-functions/functions-run-local) |
| **Bruno (API Testing)**            | [https://github.com/usebruno/bruno](https://github.com/usebruno/bruno)                                |
| **Docker Compose**                 | [https://docs.docker.com/compose/](https://docs.docker.com/compose/)                                  |
| **Jenkins**                        | https://www.jenkins.io/doc/                                            |
| **Ansible**                        | https://docs.ansible.com/                                                |
| **Terraform**                      | [https://developer.hashicorp.com/terraform/docs](https://developer.hashicorp.com/terraform/docs)      |
| **Portainer**                      | https://docs.portainer.io/                                              |
| **Prometheus**                     | https://prometheus.io/docs/introduction/overview/ |
| **Grafana**                        | https://grafana.com/docs/                                                |
| **Azure Portal**                   | https://portal.azure.com/#home                                      |
| **Application Insights**           | https://learn.microsoft.com/en-us/azure/azure-monitor/app/app-insights-overview |

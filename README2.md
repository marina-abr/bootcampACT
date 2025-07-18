## 🧪 **Use Case: PokéDelivery – Serverless Food für Pokémon**

Stell dir vor, du arbeitest im Team von **PokéDelivery**, einem innovativen Start-up, das Pokémon in ganz Kanto mit frischem Sushi beliefert: natürlich serverless, resilient und CI/CD-ready. Doch um eure potentiellen Kunden besser kennenzulernen (Pikachu liebt Lachs!), braucht ihr erst einmal mehr Daten über sie. Ihr gehört zu dem Team, das eine App zur Datenbeschaffung bereitstellen soll (Das Dev Team hat eine Entwicklerversion bereits für euch zur Verfügung gestellt). Eure Aufgabe: Eine Plattform erstellen, mit der ihr Informationen über Pokemons abrufen könnt, mit einem Hauch von DevOps-Magie.

---

ACHTUNG: Nutze als Entwicklungsumgebung eine Azure B2PTS v2 (arm) VM. Es ist eine Kundenanforderung, dass die Software auf ARM-PC laufen muss. Außerdem kannst du nur so die IT-Richtlinien einhalten!

## 🗓️ **Bootcamp Agenda (5 Tage)**

### Teamaufbau & App kennenlernen
**Ziel:** Zusammenarbeit etablieren, App verstehen und lokal zum Laufen bringen.

- 👥 **Team**
  - Überlegt euch wie ihr zusammenarbeiten und gemeinsam an derselben Code-Basis arbeiten wollt

- 🧩 **App Setup**
  - Schaut euch das Repository in Ruhe an
  - erforscht die Funktionalität
  - Lasst die Tests laufen

- 🔁 **CI/CD Basics**
  - Jede Änderung in eurem Code sollte eine automatische Überprüfung mit sich bringen; Es soll nichts integriert werden, was nicht funktioniert
  - Aus Sicherheitsgründen habt ihr vom CTO die Aufgabe bekommen, dass alle benutzten Libs immer auf neustem Stand sein sollten. Natürlich völlig automatisiert!

### Testen & Azure Function lokal
**Ziel:** App testen und lokal als Azure Function betreiben.

- ⚙️ **Azure Function lokal**
  - App lokal als Azure Function starten, als würde sie in der Cloud laufen

- 🧪 **API-Tests**
  - 1–2 API-Tests schreiben (z. B. für Pikachu & Glumanda)
  - Tests in CI integrieren (Änderungen nur bei Erfolg zulassen)

### CD, Containerisierung & CaC
**Ziel:** Continuous Deployment vorbereiten & sicher betreiben.

- 🐳 **Jenkins und Container**
  - Jenkins in Docker aufsetzen (so viel wie möglich bereits beim initialen Setup automatisieren)
  - Keine Secrets im Repository ablegen
  - Kein Zugriff für anonyme Nutzer:innen erlauben

- 🧰 **Configuration as Code**
  - Jenkins Warnungen entfernen
  - mehrere Jenkins-Agents auf unterschiedlichen Geräten aufsetzen
  - Jenkins-Agents notwendige Tools und Konfigurationen mittels Configuration as Code vornehmen (vorzugsweise Ansible, aber nicht zwingend)

### Observability & Monitoring
**Ziel:** Logs & Metriken sichtbar machen.

  - Jenkins-Metriken mit Prometheus einsammeln
  - Grafana-Dashboard für Metriken erstellen
  - Logs von Prometheus & Grafana & Jenkins mit Portainer prüfen

### Deployment & Cloud Monitoring
**Ziel:** App in Azure deployen & überwachen.

- Die App als Azure Function deployen
  - über Jenkins, nur manuell getriggert
- Metriken der App analysieren


---

## Wissenswertes

### Videos

| 🎥 **Kursname**                                                       | 🔗 **URL**                                                                                   | 🎯 **Fokus im Bootcamp**                                      |
|----------------------------------------------------------------------|----------------------------------------------------------------------------------------------|---------------------------------------------------------------|
| GitHub Actions – The Complete Guide                                  | https://capgemini.udemy.com/course/github-actions-the-complete-guide/ | Git-Crashkurs, Basics, Events                                 |
| AZ-900: Microsoft Azure Fundamentals                                 | https://capgemini.udemy.com/course/az900-azure/ | Allgemeines Verständnis, Compute & Storage                    |
| Jenkins Masterclass                                                  | https://capgemini.udemy.com/course/jenkins-masterclass/ | Komplett durchgehen                                           |
| Learn Ansible                                                        | https://capgemini.udemy.com/course/learn-ansible/ | Komplett durchgehen                                           |
| Terraform for the Absolute Beginners                                | https://capgemini.udemy.com/course/terraform-for-the-absolute-beginners/ | Komplett durchgehen                                           |
| Learn Docker                                                         | https://capgemini.udemy.com/course/learn-docker/ | Ohne Swarm & Kubernetes                                       |
| Dive into Cloud Native: Containers, Kubernetes & KCNA               | https://capgemini.udemy.com/course/dive-into-cloud-native-containers-kubernetes-and-the-kcna/ | Ohne Docker & Kubernetes     |

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
| **WSL2 (Windows Subsystem for Linux)** | [https://learn.microsoft.com/en-us/windows/wsl/install](https://learn.microsoft.com/en-us/windows/wsl/install) |
| **Terraform**                      | [https://developer.hashicorp.com/terraform/docs](https://developer.hashicorp.com/terraform/docs)      |
| **Portainer**                      | https://docs.portainer.io/                                              |
| **Prometheus**                     | https://prometheus.io/docs/introduction/overview/ |
| **Grafana**                        | https://grafana.com/docs/                                                |
| **Azure Portal**                   | https://portal.azure.com/#home                                      |
| **Application Insights**           | https://learn.microsoft.com/en-us/azure/azure-monitor/app/app-insights-overview |

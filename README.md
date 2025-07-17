## 🧪 **Use Case: PokéDelivery – Serverless Food für Pokémon**

Stell dir vor, du arbeitest im Team von **PokéDelivery**, einem innovativen Start-up, das Pokémon in ganz Kanto mit frischem Sushi beliefert: natürlich serverless, resilient und CI/CD-ready. Doch um eure potentiellen Kunden besser kennenzulernen (Pikachu liebt Lachs!), braucht ihr erst einmal mehr Daten über sie. Ihr gehört zu dem Team, das eine App zur Datenbeschaffung bereitstellen soll (Das Dev Team hat eine Entwicklerversion bereits für euch zur Verfügung gestellt). Eure Aufgabe: Eine Plattform erstellen, mit der ihr Informationen über Pokemons abrufen könnt, mit einem Hauch von DevOps-Magie.

---

## 🗓️ **Bootcamp Agenda (5 Tage)**

### 🟢 **Tag 1: Teamaufbau & App kennenlernen**
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

### 🟡 **Tag 2: Testen & Azure Function lokal**
**Ziel:** App testen und lokal als Azure Function betreiben.

- ⚙️ **Azure Function lokal**
  - `azure-functions-core-tools` installieren
  - App lokal als Azure Function starten

- 🧪 **API-Tests mit Bruno**
  - Bruno: 
  - 1–2 Tests schreiben (z. B. für Pikachu & Glumanda)
  - Tests per UI & CLI (headless) ausführen
  - Tests in GitHub Action integrieren (PR nur bei Erfolg zulassen)

### 🔵 **Tag 3: Jenkins & Containerisierung**
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

### 🟠 **Tag 4: Observability & Monitoring**
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

### 🔴 **Tag 5: Azure Deployment & Insights**
**Ziel:** App in Azure deployen & überwachen.

- ☁️ **Azure Setup**
  - Azure-Konto erstellen
  - Funktion manuell deployen & im Browser testen

- 🚀 **Jenkins Deployment Jobs**
  - Job: Azure Function via Terraform deployen
    - Letzten Git-Commit verwenden
    - Endpoint mit `curl` testen
  - Job: Azure Function löschen

- 🧪 **Umgebungen verwalten**
  - Deployment-Slots für `dev` & `prod` nutzen
  - Deploy/Delete-Jobs konfigurierbar machen

- 🔍 **Application Insights**
  - Beim Deployment aktivieren
  - Logs & Graphen in Azure Portal prüfen

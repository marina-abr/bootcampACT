Perfekt! Hier ist eine **kompakte, mentorentaugliche Anleitung** für die lokale Setup-Phase des Bootcamps – ideal für die Vorbereitung oder als Handout für Teilnehmer:innen. Ich habe sie leicht erweitert, um typische Stolpersteine zu vermeiden und den Ablauf klar zu strukturieren.

---

## 🧑‍🏫 **Mentoren-Anleitung: Lokales Setup & Jenkins-Agent**

### 🧰 **1. Tools installieren (Windows mit WSL2)**
```bash
scoop install nodejs-lts azure-functions-core-tools vagrant vscode terraform bruno
```

> 📦 **Docker Desktop** muss separat installiert werden (mit WSL2-Integration aktivieren).

---

### 🐧 **2. WSL2 mit Ubuntu einrichten**
```bash
wsl --install -d Ubuntu
```
- Benutzername & Passwort vergeben
- Danach:
```bash
wsl -d Ubuntu
sudo apt update
sudo apt install ansible -y
```

---

### 🧪 **3. Jenkins via Docker Compose starten**
- Offizielle Anleitung:  
  👉 Jenkins Docker README

- Beispiel `docker-compose.yml` (optional vorbereiten):
  ```yaml
  version: '3'
  services:
    jenkins:
      image: jenkins/jenkins:lts
      ports:
        - "8080:8080"
        - "50000:50000"
      volumes:
        - jenkins_home:/var/jenkins_home
  volumes:
    jenkins_home:
  ```

---

### ⚙️ **4. Jenkins automatisch konfigurieren (Ansible)**
- Beispielstruktur:
  ```
  ├── inventory.ini
  └── jenkins-setup.yml
  ```

- Playbook ausführen:
  ```bash
  ansible-playbook -i inventory.ini jenkins-setup.yml -K
  ```

> 🔐 `-K` fragt nach dem sudo-Passwort

---

### 🤖 **5. Jenkins-Agent verbinden**
- Agent-JAR herunterladen:
  ```bash
  curl -sO http://localhost:8080/jnlpJars/agent.jar
  ```

- Agent starten:
  ```bash
  java -jar agent.jar \
    -url http://localhost:8080/ \
    -secret <DEIN_SECRET> \
    -name "agent-1" \
    -webSocket
  ```

- Rechte vergeben:
  ```
  chmod +x setup_jenkins_home.sh
  ./setup_jenkins_home.sh
  ```

> 🔑 Das Secret findest du in Jenkins unter:  
> **Manage Jenkins → Nodes → agent-1 → Launch method → Secret**

---

### ✅ **Optional: Tipps für Mentoren**
- 🔄 **Vorbereitung:** Teste das Setup vorher selbst durch (inkl. WSL2 & Docker)
- 🧯 **Fehlerquellen:** Docker nicht gestartet, Ports belegt, falsche Secrets
- 🧭 **Hilfreich:** Portainer zur Visualisierung der Containerumgebung
- 🧪 **Test:** Jenkins-Job mit einfachem Shell-Skript zur Agent-Verifikation

---

Möchtest du daraus ein **PDF-Handout**, eine **Markdown-Datei** oder ein **Poster für den Workshopraum** machen?
## 🧪 **Use Case: PokéDelivery – Serverless Food für Pokémon**

Stell dir vor, du arbeitest im Team von **PokéDelivery**, einem innovativen Start-up, das Pokémon in ganz Kanto mit frischem Sushi beliefert: natürlich serverless, resilient und CI/CD-ready. Doch um eure potentiellen Kunden für Werbemaßnahmen besser kennenzulernen (Pikachu liebt Lachs!), braucht ihr erst einmal mehr Daten über sie. Ihr gehört zu dem Team, das eine App zur Datenbeschaffung bereitstellen soll. Eure Aufgabe: Eine Plattform erstellen, mit der ihr Informationen über Pokemons abrufen könnt, mit einem Hauch von DevOps-Magie.

---

## 📄 **Systemanforderungen – PokéDelivery**

Das Dev Team hat bereits eine Entwicklerversion der APP auf Basis des `Requirements 2` für euch zur Verfügung gestellt

### 1. **Systemumgebung**
- Das System muss auf einem ARM-Gerät/VM (RaspberryPi oder B2PTS v2 VM) mit Ubuntu 22.04 LTS betrieben werden können.
- Alle eingesetzten Softwarekomponenten (z. B. Jenkins, Docker) müssen ARM64-kompatibel sein.

---

### 2. **Applikation**
- Die Anwendung muss eine REST-API bereitstellen, die Informationen zu Pokémon liefert.
- Die API muss mindestens folgende Endpunkte unterstützen:
  - `GET /pokemon/{name}`
- Die Anwendung muss als Azure Function lokal und in der Cloud lauffähig sein.

---

### 3. **Codeverwaltung**
- Der Quellcode muss in einem zentralen Git-Repository verwaltet werden.
- Es muss eine Branching-Strategie definiert und dokumentiert sein.
- Änderungen am Code dürfen nur nach erfolgreichem Review und bestandener CI integriert werden.

---

### 4. **Continuous Integration**
- Jede Änderung im Repository muss automatisch einen Build- und Testprozess auslösen.
- Die CI-Pipeline muss automatisierte API-Tests ausführen.
- Die CI-Umgebung muss auf ARM64-Architektur lauffähig sein.

---

### 5. **Security & Compliance**
- Es dürfen keine Zugangsdaten, Tokens oder Secrets im Quellcode-Repository gespeichert werden.
- Die eingesetzten Bibliotheken müssen regelmäßig auf Sicherheitslücken geprüft und aktualisiert werden.
- Der Zugriff auf CI/CD-Systeme (z. B. Jenkins) muss authentifiziert und rollenbasiert erfolgen.

---

### 6. **Containerisierung & Jenkins**
- Jenkins muss als Docker-Container auf ARM64 lauffähig sein.
- Die Jenkins-Konfiguration muss möglichst vollständig als Code vorliegen.
- Es müssen mindestens zwei Jenkins-Agents auf unterschiedlichen Geräten/VMs eingerichtet werden.
- Die Agent-Konfiguration muss automatisiert erfolgen (z. B. via Ansible).

---

### 7. **Monitoring & Observability**
- Jenkins muss Metriken über einen Prometheus-kompatiblen Endpoint bereitstellen.
- Prometheus muss diese Metriken erfassen.
- Grafana muss ein Dashboard zur Visualisierung der CI/CD-Metriken bereitstellen.
- Logs aller relevanten Container (Jenkins, Prometheus, Grafana) müssen über Portainer einsehbar sein.

---

### 8. **Deployment**
- Die Anwendung muss über Jenkins manuell in Azure deploybar sein.
- Das Deployment erfolgt Terraform.
- Die Anwendung muss Metriken bereitstellen, die über Azure Application Insights analysierbar sind.

### 9. Dokumentation
- Eine Dokumentation der Architektur soll vorliegen.
- Eine Entwickler Dokumentation soll vorliegen.
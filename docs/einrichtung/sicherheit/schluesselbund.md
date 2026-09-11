# Schlüsselbund verstehen

## Was ist der Schlüsselbund?

Der **Schlüsselbund** (englisch: *Keyring*) ist ein **verschlüsselter Safe** auf deinem Computer, in dem sensible Daten gespeichert werden:

- **Verschlüsselungsschlüssel** (für Chats, Nachrichten)
- **Sitzungs-Token** (damit du angemeldet bleibst)
- **API-Schlüssel** (für Anwendungen)

!!! question "Warum nicht einfach auf der Festplatte speichern?"

    Weil deine Passwörter dann im Klartext lesbar wären – wenn jemand Zugriff auf deinen Computer hat, könnte er alles sehen. Der Schlüsselbund verschlüsselt diese Daten, sodass sie ohne das richtige Passwort unlesbar sind.

---

## Wie funktioniert der Schlüsselbund?

### Der Verschlüsselungs-Prozess

1. **Du loggst dich an** mit deinem Benutzerpasswort (z. B. "passwort123")
2. **Das System entsperrt automatisch den Schlüsselbund** mit deinem Passwort
3. **Programme können jetzt auf Schlüssel aus dem Schlüsselbund zugreifen**, ohne dich jedes Mal zu fragen
4. **Nach dem Logout** wird der Schlüsselbund wieder gesperrt

!!! tip "Das Wichtigste"

    Normalerweise sollte dein **Benutzerpasswort = Schlüsselbund-Passwort** sein. Das ermöglicht die automatische Entsperrung.

---

## Gibt es nur einen Schlüsselbund?

**Nein.** Es kann mehrere Schlüsselbunde geben.

Der **Standard-Schlüsselbund** ("Login"):

- **Was:** Der Hauptschlüsselbund für dein Benutzerkonto
- **Wofür:** Speichert Verschlüsselungen von Websites, Apps und Systemen
- **Wird automatisch angelegt:** Beim ersten Login oder wenn du zum ersten Mal ein Passwort speichern möchtest
- **Wird automatisch entsperrt:** Wenn du dich anmeldest (falls Passwort = Benutzerpasswort)

!!! info "Zusätzliche Schlüsselbunde"

    Manchmal erstellen Programme ihre eigenen Schlüsselbunde:

    - **Wire, Signal, Telegram:** Können eigene Schlüsselbunde für Verschlüsselung anlegen
    - **Firefox, Chromium:** Können separate Schlüsselbunde für Browser-Schlüssel haben
    - **Spezial-Apps:** Manche Anwendungen legen eigene Schlüsselbunde an

---

## Den Schlüsselbund verwalten

### Schlüsselbunde anschauen

Du kannst alle deine Schlüsselbunde im Programm **"Passwörter und Verschlüsselungen"** (auch *Seahorse* genannt) sehen:

1. Öffne das Menü und suche nach **"Schlüsselbund"**
2. Oder öffne ein Terminal und gib `seahorse` ein
3. Dort siehst du alle deine Schlüsselbunde und deren Inhalte

### Einen Schlüsselbund sperren/entsperren

- **Rechtsklick auf einen Schlüsselbund** → **Sperren** oder **Entsperren**
- Oder rechts auf das Schloss in der entsprechenden Zeile
- Wenn du ihn sperrst, wird das Passwort verlangt, um ihn wieder zu öffnen

### Passwort eines Schlüsselbundes ändern

1. Öffne **Passwörter und Verschlüsselungen**
2. **Rechtsklick auf den Schlüsselbund** → **Passwort ändern**
3. Gib das **aktuelle Passwort** ein
4. Setze ein **neues Passwort**

!!! note "Wichtig"
    
    Wenn du das Passwort änderst, achte darauf, dass es gleich deinem Benutzerpasswort ist – sonst musst du es nach jedem Login manuell eingeben!

### Einen Schlüsselbund löschen

1. Öffne **Passwörter und Verschlüsselungen**
2. **Rechtsklick auf den Schlüsselbund** → **Löschen**

!!! Warning "Achtung"

    Alle gespeicherten Schlüssel in diesem Schlüsselbund gehen verloren!

---

??? Question "Häufige Fragen"

    **F: Warum wird mir nach dem Schlüsselbund-Passwort gefragt, obwohl ich mich gerade angemeldet habe?**  
    A: Das passiert, wenn das Schlüsselbund-Passwort anders ist als dein Benutzerpasswort. Der Schlüsselbund wird dann nicht automatisch entsperrt.

    **F: Kann ich mehrere Schlüsselbunde haben?**  
    A: Ja, das ist normal. Jede App kann ihren eigenen Schlüsselbund anlegen. Du kannst aber auch alles in einem zusammenfassen.

    **F: Ist der Schlüsselbund sicher?**  
    A: Ja, wenn dein Benutzerpasswort sicher ist. Der Schlüsselbund nutzt starke Verschlüsselung (AES-256). Solange nur du Zugriff auf deinen Computer hast, sind deine Daten sicher.

    **F: Kann ich den Schlüsselbund deaktivieren?**  
    A: Nicht wirklich – und du solltest das auch nicht tun. Der Schlüsselbund ist ein wichtiger Sicherheitsmechanismus.

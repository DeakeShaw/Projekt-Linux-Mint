# Installation

Dieses Handbuch führt dich durch die Installation der Treiber für unsere neuen Quittungs-Scanner unter Linux. 
Folge einfach den Schritten.

!!! warning "Vorbereitung"
    Stelle sicher, dass du das **Administrator-Passwort** des Computers zur Hand hast. 
    Du wirst es im Verlauf der Installation benötigen.

---

## 1. Software herunterladen

1. Öffne deinen Browser und gehe auf das [Epson Download Center](https://download-center.epson.com/softwares/?device_id=ES-50&region=DE&os=DEBX64&language=de).
    - Prüfe, dass als Betriebssystem **Linux Deb(x64)** ausgewählt ist.
    - Als Land/Region sollte **Deutschland** ausgewählt sein.

2. Suche in der Tabelle nach der Zeile **Epson Scan2**.
3. Klicke in dieser Zeile auf **WEITER ZUM DOWNLOAD**.

4. Auf der neuen Seite erscheint die **SOFTWARE-LIZENZVEREINBARUNG**.
    - Bestätige: **Ich stimme der Softwarelizensvereinbarung zu.**

5. Klicke unten rechts auf den nun blauen Button **HERUNTERLADEN**.

6. Die Datei wird heruntergeladen. Sie befindet sich später in deinem `Downloads`-Ordner.
   
    ??? info "Dateiname"
        Die Datei sollte ähnlich heißen: `epsonscan2-bundle-6.7.90.0.x86_64.deb.tar.gz`  
        *(Die Zahlen können leicht variieren. Wichtig ist die Endung `.tar.gz`.)*

---

## 2. Datei entpacken

1. Öffne den Ordner **Downloads**.
2. Mache einen **Rechtsklick** auf die heruntergeladene Datei.
3. Wähle im Kontextmenü **Hier entpacken** (meistens die zweite Option von unten).

    !!! note "Ergebnis"
        Es wird ein neuer Ordner erstellt, der denselben Namen hat, jedoch **ohne** die Endung `.tar.gz`.

4. Öffne diesen neuen Ordner per Doppelklick.

---

## 3. Installation ausführen

1. Suche im Ordner die Datei `install.sh`.
2. Mache einen **Doppelklick** auf die Datei.

3. Es erscheint ein Fenster mit der Frage, wie die Datei ausgeführt werden soll.
    - Klicke links auf **Im Terminal ausführen**.

4. Es öffnet sich ein schwarzes Terminal-Fenster.
    - Du wirst nach dem **Administrator-Passwort** gefragt.
    - Gib das Passwort ein und drücke **Enter**.

    !!! danger "Wichtig beim Passwort eingeben"
        Unter Linux kann es sein, dass du **keine Sternchen (*) oder Punkte** siehst, wenn du das Passwort tippst.  
        Das ist normal! Einfach blind tippen und Enter drücken.

5. Warte, bis die Installation abgeschlossen ist. Das Terminal schließt sich automatisch, sobald der Prozess fertig ist.

---

## 4. Aufräumen

Die Installation ist erfolgreich abgeschlossen. Du kannst nun die Installationsdateien löschen, um Platz zu sparen:

1. Gehe zurück in deinen `Downloads`-Ordner.
2. Lösche die ursprüngliche `.tar.gz` Datei.
3. Lösche den entpackten Ordner.

Der Epson Scan2 ist nun installiert und einsatzbereit. 🎉

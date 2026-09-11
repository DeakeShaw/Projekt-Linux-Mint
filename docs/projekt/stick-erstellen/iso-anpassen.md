# ISO-Anpassen

## Programme installieren
!!! info
    Firefox, Thunderbid und LibreOffice sind schon Standardweise installiert.

``` sh
apt update

apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

=== "Chromium"

    ``` sh
    apt install -y chromium
    
    xdg-settings set default-web-browser chromium-browser.desktop

    sed -i '/^Exec=/ s/\(%[uUfF]\|$\)/ --password-store=basic \1/' /usr/share/applications/chromium-browser.desktop
    sed -i 's/Name\[de\]=Chromium-Webbrowser/Name[de]=Chromium/' /usr/share/applications/chromium-browser.desktop
    ```

=== "Tesseract"

    ``` sh
    apt install -y tesseract-ocr tesseract-ocr-deu
    ```

=== "Wire"

    ``` sh
    apt install -y apt-transport-https
    wget -q https://wire-app.wire.com/linux/releases.key -O- | apt-key add -
    echo "deb https://wire-app.wire.com/linux/debian stable main" | tee /etc/apt/sources.list.d/wire-desktop.list
    apt update
    apt install -y wire-desktop
    ```

=== "NAPS2"

    ``` sh
    NAPS2_URL=$(curl -s https://api.github.com/repos/cyanfish/naps2/releases/latest | grep "browser_download_url.*linux-x64.deb" | cut -d '"' -f 4 | head -1)
    wget -O /tmp/naps2.deb "$NAPS2_URL"
    apt install -y /tmp/naps2.deb
    ```

=== "RustDesk"

    ``` sh
    flatpak install -y flathub com.rustdesk.RustDesk
    ```

=== "KeePassXC"

    ``` sh
    flatpak install -y flathub org.keepassxc.KeePassXC
    ```

=== "Syncthing"

    ```sh
    apt install syncthing
    ```

## Desktop-Icons hinzufügen

`mkdir -p /etc/skel/Desktop`

=== "Papierkorb"

    ``` sh
    cat > /etc/skel/Desktop/trash.desktop << 'EOF'
    [Desktop Entry]
    Name=Papierkorb
    Comment=Gelöschte Dateien
    Icon=user-trash
    Type=Application
    Exec=nemo trash:///
    Terminal=false
    EOF
    ```

=== "File Manager"

    ``` sh
    cp /usr/share/applications/nemo.desktop /etc/skel/Desktop/
    ```

=== "LibreOffice"

    ``` sh
    cp /usr/share/applications/libreoffice-startcenter.desktop /etc/skel/Desktop/
    ```

=== "Chromium"

    ``` sh
    cp /usr/share/applications/chromium-browser.desktop /etc/skel/Desktop/
    ```

=== "Firefox"

    ``` sh
    cp /usr/share/applications/firefox.desktop /etc/skel/Desktop/
    ```

=== "NAPS2"

    ``` sh
    cp /usr/share/applications/naps2.desktop /etc/skel/Desktop/
    ```

=== "KeePassXC"

    ``` sh
    cp /var/lib/flatpak/exports/share/applications/org.keepassxc.KeePassXC.desktop /etc/skel/Desktop/
    ```

alle ausführbar machen  
`chmod +x /etc/skel/Desktop/*.desktop`

## Chromium-Bookmarks hinzufügen

``` sh
mkdir -p /etc/skel/.config/chromium/Default/
cat > /etc/skel/.config/chromium/Default/Bookmarks << 'EOF'
{
    "checksum": "0000000000000000000000000000000",
    "roots": {
        "bookmark_bar": {
            "children": [
                {
                    "date_added": "13324876811749995",
                    "guid": "00000000-0000-0000-0000-000000000001", 
                    "id": "4",
                    "name": "Lumo AI",
                    "type": "url",
                    "url": "https://lumo.proton.me/"
                },
                {
                    "date_added": "13324876811749995",
                    "guid": "00000000-0000-0000-0000-000000000001",
                    "id": "5",
                    "name": "Hilfe",
                    "type": "url",
                    "url": "https://deakeshaw.github.io/Projekt-Felicitas/"
                },
                {
                    "date_added": "13324876811749995",
                    "guid": "00000000-0000-0000-0000-000000000001",
                    "id": "6",
                    "name": "MJH",
                    "type": "url",
                    "url": "https://stiftunghaar.myjugendhilfe.de/Login.aspx"
                }
            ],
            "date_added": "13000000000000000",
            "date_modified": "0",
            "guid": "00000000-0000-0000-0000-000000000011",
            "id": "1",
            "name": "Lesezeichenleiste",
            "type": "folder"
        },
        "other": {
            "children": [],
            "date_added": "13000000000000000",
            "date_modified": "0",
            "guid": "00000000-0000-0000-0000-000000000012",
            "id": "2",
            "name": "Weitere Lesezeichen",
            "type": "folder"
        },
        "synced": {
            "children": [],
            "date_added": "13000000000000000",
            "date_modified": "0",
            "guid": "00000000-0000-0000-0000-000000000013",
            "id": "3",
            "name": "Mobile Lesezeichen",
            "type": "folder"
        }
    },
   "version": 1
}
EOF
```

## Chromium-Add-Ons hinzufügen

``` sh
sudo mkdir -p /etc/chromium/policies/managed
cat > /etc/chromium/policies/managed/extensions.json << 'EOF'
{
    "ExtensionInstallForcelist": [
        "ddkjiahejlhfcafbddmgiahcphecmpfh;https://clients2.google.com/service/update2/crx",
        "oboonakemofpalcgghocfoadofidjkkk;https://clients2.google.com/service/update2/crx",
        "oldceeleldhonbafppcapldpdifcinji;https://clients2.google.com/service/update2/crx"
    ]
}
EOF
```

## Guest-User aktivieren

```sh
cat > /etc/lightdm/lightdm.conf << 'EOF'
[Seat:*]
allow-guest=true
EOF
```

## Mitarbeiter Account Skript

Eine hoffentlich vorübergehende "einfache" Lösung ist es den Account in Form eines Skriptes erstellen zu lassen, welches wir einfach nach dem ersten Boot einmal ausführen.

Hierfür das Skript einmal von [hier](../../assets/scripts/mitarbeiter.sh){:download="mitarbeiter.sh"} gedownloaded werden.  
Anschließend in `cd /home/` und mittels Drag and Drop hineinkopieren. 

Ebenso müssen auch folgende Logos gedownloaded werden: [MyJugendhilfe](../../assets/images/iso-webapp-images/mjh.png){:download}, [Stiftung](../../assets/images/iso-webapp-images/help.png){:download}.  
Diese müssen dann auch per Drag and Drop unter `cd /usr/share/icons` abgelegt werden.

### Inhalt des Skriptes

Erstellen des Mitarbeiter-Accounts, sowie das Vergeben eines temporären Passworts.

``` sh
adduser --disabled-password --gecos "Mitarbeiter" mitarbeiter
echo "mitarbeiter:changeme" | sudo chpasswd 
```

---

Erstellen von zwei zusätzlichen WebApps die von den Mitarbeitern genutzt werden. Für welche wir zuvor die Icons importiert haben.

=== "MyJugendHilfe"

    ``` sh
    cat > /home/mitarbeiter/Desktop/MyJugendhilfe.desktop << 'MJH'
    [Desktop Entry]
    Version=1.0
    Type=Application
    Name=MyJugendhilfe
    Exec=chromium --app=https://stiftunghaar.myjugendhilfe.de/Login.aspx
    Icon=/usr/share/icons/mjh.png
    Terminal=false
    StartupNotify=true
    MJH
    ```

=== "Hilfe Seite der Stiftung"

    ``` sh
    cat > /home/mitarbeiter/Desktop/Hilfe.desktop << 'HELP'
    [Desktop Entry]
    Version=1.0
    Type=Application
    Name=Hilfe
    Exec=chromium --app=https://deakeshaw.github.io/Projekt-Felicitas/
    Icon=/usr/share/icons/help.png
    Terminal=false
    StartupNotify=true
    HELP
    ```

---

Hinzufügen der restlichen Desktop Icons

=== "Thunderbird"

    ``` sh
    sed -i 's/Name\[de\]=Thunderbird-E-Mail und -Nachrichten/Name[de]=Thunderbird/' /usr/share/applications/thunderbird.desktop # (1)!

    cp /usr/share/applications/thunderbird.desktop /home/mitarbeiter/Desktop/
    ```

    1. Hier wird noch der angezeigte Text von `Thunderbird-E-Mail und -Nachrichten` zu `Thunderbird` geändert.

=== "RustDesk"

    ``` sh
    cp /var/lib/flatpak/exports/share/applications/com.rustdesk.RustDesk.desktop /home/mitarbeiter/Desktop/
    ```

=== "Wire"

    ``` sh
    cp /usr/share/applications/wire-desktop.desktop /home/mitarbeiter/Desktop/
    ```

Alle Desktop-Apps werden dann ausführbar gemacht:  
``` sh
chmod +x /home/mitarbeiter/Desktop/*.desktop
```  
Und die Rechte an den Mitarbeiter übergeben:
``` sh
chown -R mitarbeiter:mitarbeiter /home/mitarbeiter/Desktop/*.desktop
```  

---

Die beiden WebApps werden auch noch in den Apps Ordner geschoben, damit sie auch über eine Systemsuche auffindbar sind:
``` sh
cp /home/mitarbeiter/Desktop/MyJugendhilfe.desktop /home/mitarbeiter/.local/share/applications/
cp /home/mitarbeiter/Desktop/Hilfe.desktop         /home/mitarbeiter/.local/share/applications/
```

---

Dann werden auch noch icons zum Admin account hinzugefügt
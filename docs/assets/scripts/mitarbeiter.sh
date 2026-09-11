adduser --disabled-password --gecos "Mitarbeiter" mitarbeiter
echo "mitarbeiter:changeme" | sudo chpasswd 

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

sed -i 's/Name\[de\]=Thunderbird-E-Mail und -Nachrichten/Name[de]=Thunderbird/' /usr/share/applications/thunderbird.desktop

cp /var/lib/flatpak/exports/share/applications/com.rustdesk.RustDesk.desktop /home/mitarbeiter/Desktop/
cp /usr/share/applications/wire-desktop.desktop /home/mitarbeiter/Desktop/
cp /usr/share/applications/thunderbird.desktop /home/mitarbeiter/Desktop/

chmod +x /home/mitarbeiter/Desktop/*.desktop
chown -R mitarbeiter:mitarbeiter /home/mitarbeiter/Desktop/*.desktop

cp /home/mitarbeiter/Desktop/MyJugendhilfe.desktop /home/mitarbeiter/.local/share/applications/
cp /home/mitarbeiter/Desktop/Hilfe.desktop /home/mitarbeiter/.local/share/applications/

cp /home/mitarbeiter/Desktop/Hilfe.desktop /home/admin-sh/Desktop
cp /home/mitarbeiter/Desktop/Hilfe.desktop /home/admin-sh/.local/share/applications/
cp /home/mitarbeiter/Desktop/com.rustdesk.RustDesk.desktop /home/admin-sh/Desktop

chmod +x /home/admin-sh/Desktop/*.desktop
chown -R admin-sh:admin-sh /home/admin-sh/Desktop/*.desktop

rm /home/mitarbeiter.sh

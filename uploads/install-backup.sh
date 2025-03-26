sudo timedatectl set-timezone Asia/Jakarta
sudo wget -O /etc/systemd/system/backup.timer https://raw.githubusercontent.com/KerenBetGw/files/main/uploads/backup.timer
sudo wget -O /etc/systemd/system/backup.service https://raw.githubusercontent.com/KerenBetGw/files/main/uploads/backup.service
sudo wget -O /root/bc.sh https://raw.githubusercontent.com/KerenBetGw/files/main/uploads/bc.sh
chmod +x /root/bc.sh
systemctl daemon-reload
systemctl enable --now backup.timer
# Nama service yang ingin dicek
SERVICE_NAME="backup.timer"

# Cek status service
STATUS=$(systemctl is-active "$SERVICE_NAME")
if [ "$STATUS" = "active" ]; then
  echo "[$(date)] ✅ Service $SERVICE_NAME aktif (running)."
else
  echo "[$(date)] ❌ Service $SERVICE_NAME tidak aktif (status: $STATUS)."
  exit 1
fi
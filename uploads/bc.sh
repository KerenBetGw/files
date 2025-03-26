#!/bin/bash

# Nama file backup
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
ZIP_FILE="mora_$TIMESTAMP.zip"

LOG_FILE="log.txt"

# Tambahkan log baru dengan timestamp
echo "[$TIMESTAMP] Event: Backup dimulai" >> "$LOG_FILE"

# Lihat isi file
cat "$LOG_FILE"

# 1. Zip folder mora
zip -r $ZIP_FILE mora/

# 2. Upload ke bashupload.com
UPLOAD_RESPONSE=$(curl -s --upload-file $ZIP_FILE https://bashupload.com/$ZIP_FILE)

# 3. Kirim output upload ke Telegram
TELEGRAM_BOT_TOKEN="6483981163:AAF9hMhavGJNB86Cdab9Cy8O2ZUCXuj5-xE"
TELEGRAM_CHAT_ID="YOUR_CHAT_ID"
MESSAGE="Backup uploaded: $UPLOAD_RESPONSE"

curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
    -d chat_id="5888076846" \
    -d text="$MESSAGE"

# 4. Hapus file zip setelah upload (opsional)
rm $ZIP_FILE


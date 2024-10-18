#!/bin/bash

# SMTP bilgilerini içeren dosya
SMTP_FILE="smtp_info.txt"  # dum sunucular


# Mail ayarları
FROM_EMAIL="admin@domain.com.tr"
FROM_NAME="Test Gönderen"
SMTP_SERVER="mail.domain.com.tr"
PASSWORD="Enessahin09."
PORT="587"  # 465 veya 587 portunu belirleyebilirsin
TO_EMAIL="testt@gmail.com"

# Mail gönderme fonksiyonu
send_mail() {
    local email="$1"
    local smtp_server="$2"
    local password="$3"
    local recipient="$4"

    # Konu kısmında sadece SMTP sunucu adını kullan
    local subject="$smtp_server"
    local body="Bu bir test mailidir. Dikkate almayınız `date`"

    echo "Mail gönderiliyor: $recipient ($smtp_server) Port: $PORT"

    swaks --to "$recipient" \
          --from "$email" \
          --header "Subject: $subject" \
          --body "$body" \
          --server "$smtp_server" \
          --port "$PORT" \
          --auth LOGIN \
          --auth-user "$email" \
          --auth-password "$password" \
          --tls
}

# 1. Adım: Tüm sunuculara gidip `test@gmail.com` adresine mail atma
echo "1. Adım: Test e-postasını göndermek için tüm sunucuları kontrol ediyorum..."

while IFS=' ' read -r email smtp_server password; do
    if [[ -n "$email" && -n "$smtp_server" && -n "$password" ]]; then
        send_mail "$email" "$smtp_server" "$password" "$TO_EMAIL"
    fi
done < "$SMTP_FILE"

# 2. Adım: `mail.domain.com.tr` sunucusuna gidip tüm sunuculara mail atma
echo "2. Adım: Tüm sunuculara `mail.enessahins.com.tr` sunucusundan e-posta gönderiyorum..."

while IFS=' ' read -r email smtp_server password; do
    if [[ -n "$email" && -n "$smtp_server" && -n "$password" ]]; then
        send_mail "$FROM_EMAIL" "$SMTP_SERVER" "$PASSWORD" "$email"
    fi
done < "$SMTP_FILE"

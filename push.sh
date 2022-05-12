#! /bin/sh

TOKEN="Some token"
APP_BUNDLE="com.myApp.bundle"
PUSH_BODY=`cat $1`
CERT_PATH="cert.p12"
CERT_PASS=""
APNS_PRIORITY=5

if [[ -n $CERT_PASS ]]; then
	CERT_PATH="$CERT_PATH:$CERT_PASS"
fi

curl -v \
-d "$PUSH_BODY" \
--header "apns-topic: $APP_BUNDLE" \
--header "apns-priority: $APNS_PRIORITY" \
--http2 \
--cert-type P12 --cert $CERT_PATH \
"https://api.development.push.apple.com/3/device/$TOKEN"

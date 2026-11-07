#!/usr/bin/env bash
# Exports donate-page.html to donate-page.png: US Letter at 300 dpi (2550 x 3300).
# Needs Google Chrome. The QR code (qr-donate.png) only changes if the URL does:
#   python3 -c "import qrcode; q=qrcode.QRCode(error_correction=qrcode.constants.ERROR_CORRECT_M, box_size=12, border=2); q.add_data('https://chiyambi.org/donate'); q.make(fit=True); q.make_image(fill_color='#2d1840', back_color='white').save('qr-donate.png')"
set -euo pipefail
cd "$(dirname "$0")"
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless=new --hide-scrollbars --force-device-scale-factor=3.125 \
  --window-size=816,1056 --screenshot="$PWD/donate-page.png" "file://$PWD/donate-page.html"
sips -s dpiWidth 300 -s dpiHeight 300 donate-page.png >/dev/null  # so Word inserts it at 8.5 x 11 in

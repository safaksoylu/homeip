# Installation

```
    curl -O https://raw.githubusercontent.com/safaksoylu/homeip/master/install.sh
    chmod +x install.sh
    sudo ./homeip/install.sh <your_authtoken> <region> <socks5_port> <PROXY_USER> <PROXY_PASSWORD>
    
    cd /opt/exporter
    curl -O https://raw.githubusercontent.com/safaksoylu/homeip-exporter/main/credentials.json?token=ACIKQ53UKKWHAAYZGJKSUOTACMFGI
    curl -O https://raw.githubusercontent.com/safaksoylu/homeip-exporter/main/token.json?token=ACIKQ54YQ4VYPM3CXBAZVSTACMFIK
    
    systemctl enable exporter.service
    systemctl start exporter.service
```

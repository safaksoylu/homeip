# Installation

```
    curl -O https://raw.githubusercontent.com/safaksoylu/homeip/master/install.sh
    chmod +x install.sh
    sudo ./homeip/install.sh <your_authtoken> <region> <socks5_port> <PROXY_USER> <PROXY_PASSWORD>
    
    cd /opt/exporter
    curl https://raw.githubusercontent.com/safaksoylu/homeip-exporter/main/credentials.json?token= --output credentials.json
    curl https://raw.githubusercontent.com/safaksoylu/homeip-exporter/main/token.json?token= --output token.json
    
    sudo systemctl enable exporter.service
    sudo systemctl start exporter.service
```

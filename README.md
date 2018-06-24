## Simple MQTT client with TLS support

Install the requirements from the `requirements.txt`:

```bash
$~ : pip install -r requirements.txt
```

Provide `CERT_PATH` variable:

```bash
$~ : export CERT_PATH=`pwd`/conf
```

Run the Python script:

```bash
$~ : python3 main.py
```

## Example configuration for Mosquitto

```bash
use_identity_as_username true
require_certificate true
certfile <HOME_PATH>/tls-mqtt/conf/server.crt
cafile <HOME_PATH>/tls-mqtt/conf/ca.crt
keyfile <HOME_PATH>/tls-mqtt/conf/server.key
```

# **Configurar VPN usando openfortivpn:**

### **1. Asegúrate de tener instalado `openfortivpn`:**
 - Si no lo tenes instalado, ejecuta:
```sh
sudo apt install openfortivpn
```

### **2. Crear un archivo de configuración para openfortivpn:**
 - Abrir el archivo de configuración de `openfortivpn`:
```sh
sudo nano /etc/openfortivpn/config
```

 - Agregá lo siguiente:

```ini
host = fortivpn.mendoza.gov.ar
username = username # externox.sistemasdic
password = TU_CONTRASEÑA  # (deja vacío para que se pida al conectar)
trusted-cert = # hash trusted-cert -> lo puedes obtener del servidor desde el servidor que hostea fortivpn
# ca-file = /etc/openfortivpn/fortinet_cert.pem # Solo en caso de tenerlo, lo puedes obtner del servidor que hostea fortivpn
```

### **3. Ejecutar la VPN desde la terminal:**
 - Con el archivo de configuración listo, podes conectarte a la VPN usando el siguiente comando:
```sh
nohup sudo openfortivpn -q > /dev/null 2>&1 &
```
 - Esto hará que la vpn se ejecute en segundo plano si cierras la terminal

## **Alias:**
 - Agrega el siguiente alias a `bashrc` o `zshrc` según corresponda:

### **1. Abre tu archivo de configuración:**
```sh
nano ~/.bashrc
```
o
```sh
nano ~/.zshrc
```

### **2. Agrega el alias:**

 - Si queres que se corra en segundo plano (no te indica tu ip para matar el proceso buscarlo con ps aux | grep fortivpn)

 ```sh
alias connectVpn='sudo nohup openfortivpn -v > /dev/null 2>&1 &'
```

 - Si queres correrlo en primer plano (te indica tu ip y podes reiniciarlo)
```sh
alias connectVpn='sudo openfortivpn -q'
```
<!-- -q disminuye el verbose y -v lo aumenta -->

### **3. Guarda los cambios:**
 - Si usaste `nano`, presiona:  
- `CTRL + X` para salir  
- `Y` para guardar  
- `Enter` para confirmar  

### **4. Reinicia la terminal:**
```sh
source ~./bashrc
```
o
```sh
source ~./zshrc
```

### **5. Prueba el alias:**

```sh
connectVpn
```


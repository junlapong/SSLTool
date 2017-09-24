SSLTool 
=======

Online Tools
------------

### Qualys SSL Labs
* https://www.ssllabs.com/ssltest/

### Symantec SSL Cert Tools
* https://cryptoreport.websecurity.symantec.com/checker/

### Check Headers
* https://securityheaders.io/
* https://httpsecurityreport.com/
* http://cyh.herokuapp.com/cyh

Offline Tools
-------------

### Burp
* https://portswigger.net/burp/downloadfree.html

### OpenSSL
* https://www.openssl.org/

```
### Test SSL Connection ###

openssl s_client -connect server.com:443
```

### SSLyze
* https://github.com/nabla-c0d3/sslyze/releases/

```
### OS X Installation ###
brew install python
pip install sslyze

### Test ###
sslyze --regular www.google.co.th
```

### SSLScan
* http://sourceforge.net/projects/sslscan/

### SSLScan (rbsec)
* https://github.com/rbsec/sslscan/

### TestSSLServer
* http://www.bolet.org/TestSSLServer/

### Portecle - GUI for creating, managing keystores, certificates, etc
* http://portecle.sourceforge.net/

### A few frequently used SSL commands
* http://shib.kuleuven.be/docs/ssl_commands.shtml

### Java Keytool

#### Convertion between JKS and P12
```
# JKS → P12:
keytool -importkeystore -srckeystore keystore.jks -srcstoretype JKS -deststoretype PKCS12 -destkeystore keystore.p12

# P12 → JKS:
keytool -importkeystore -srckeystore keystore.p12 -srcstoretype PKCS12 -deststoretype JKS -destkeystore keystore.jks
```

#### Create keystore
```
keytool -genkey -alias secbank -keyalg RSA -keysize 2048 -dname "CN=localhost, OU=ALL STAR C(*)DING, O=BAY, L=Bangkok, ST=Bangkok, C=TH" -keystore secbank.jks -validity 365

# LIST
keytool -list -v -keystore secbank.jks
```

#### Export public key
```
## PEM (ASCII) ##
keytool -exportcert -alias secbank -keystore secbank.jks -rfc -file secbank-pem.cer

## DER (BINARY) ##
keytool -exportcert -alias secbank -keystore secbank.jks -file secbank.cer
```

#### Export private key
```
## PEM (ASCII) ##
openssl pkcs12 -in secbank.p12 -nodes -nocerts -out secbank-pem.key

## DER (BINARY) ##
openssl pkcs12 -in secbank.p12 -nocerts -out secbank.key
```

### HTTP Public Key Pinning (HPKP)
* https://developer.mozilla.org/en-US/docs/Web/HTTP/Public_Key_Pinning

#### gen pin-sha256 for HPKP
```
## from public key (PEM)
openssl x509 -in secbank-pem.cer -pubkey -noout | openssl rsa -pubin -outform der | openssl dgst -sha256 -binary | openssl enc -base64

## from private key (PEM)
openssl rsa -in secbank-pem.key -outform der -pubout | openssl dgst -sha256 -binary | openssl enc -base64
```

### cURL

* [Two-way ssl using cURL](http://venkateshragi.blogspot.com/2013/04/two-way-ssl-using-curl.html)

#### Using cURL for two-way ssl communication

Open a terminal and follow the following commands.
```
curl -E /path/to/client/certificate --key /path/to/client/private/key https://server/url/path
```

Ex:
```
curl -E /path/to/client/certificate.pem --key /path/to/client/clientprivatekey.pem https://commonName/
```

Notes: `commonName` in above server url is the one given while generating the server's certificate

```
-E, --cert <certificate[:password]> Client certificate file and password
    --key <key>     Private key file name
```

### NMAP

```
$ nmap --script ssl-enum-ciphers -p 443 example.com

PORT    STATE SERVICE
443/tcp open  https
| ssl-enum-ciphers:
|   TLSv1.0:
|     ciphers:
|       TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (rsa 2048) - A
|       TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (rsa 2048) - A
|       TLS_RSA_WITH_AES_128_CBC_SHA (rsa 2048) - A
|       TLS_RSA_WITH_AES_256_CBC_SHA (rsa 2048) - A
|       TLS_RSA_WITH_3DES_EDE_CBC_SHA (rsa 2048) - C
|     compressors:
|       NULL
|     cipher preference: server
|     warnings:
|       64-bit block cipher 3DES vulnerable to SWEET32 attack
|   TLSv1.1:
|     ciphers:
|       TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (rsa 2048) - A
|       TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (rsa 2048) - A
|       TLS_RSA_WITH_AES_128_CBC_SHA (rsa 2048) - A
|       TLS_RSA_WITH_AES_256_CBC_SHA (rsa 2048) - A
|       TLS_RSA_WITH_3DES_EDE_CBC_SHA (rsa 2048) - C
|     compressors:
|       NULL
|     cipher preference: server
|     warnings:
|       64-bit block cipher 3DES vulnerable to SWEET32 attack
|   TLSv1.2:
|     ciphers:
|       TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (rsa 2048) - A
|       TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 (rsa 2048) - A
|       TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (rsa 2048) - A
|       TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (rsa 2048) - A
|       TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (rsa 2048) - A
|       TLS_RSA_WITH_AES_128_GCM_SHA256 (rsa 2048) - A
|       TLS_RSA_WITH_AES_256_GCM_SHA384 (rsa 2048) - A
|       TLS_RSA_WITH_AES_128_CBC_SHA (rsa 2048) - A
|       TLS_RSA_WITH_AES_256_CBC_SHA (rsa 2048) - A
|       TLS_RSA_WITH_3DES_EDE_CBC_SHA (rsa 2048) - C
|     compressors:
|       NULL
|     cipher preference: server
|     warnings:
|       64-bit block cipher 3DES vulnerable to SWEET32 attack
|_  least strength: C
```

Books
-----

### Bulletproof SSL and TLS
* https://www.feistyduck.com/books/bulletproof-ssl-and-tls/
* https://github.com/ivanr/bulletproof-tls/

# PACU

This os fork https://github.com/thirdbyte/pacu project with updates:
- Added support Evilginx 3
- Added support last version golang in Docker
- Edited default redirect_url in Evilginx to "https://google.com"

## Quick Way (Pull Docker Images) / For Ubuntu 20.04 LTS (AWS) Only

### Install

```
curl -sSL raw.githubusercontent.com/thirdbyte/pacu/main/init.sh | bash
```

or

```
curl -sSL bit.ly/3haQKqI | bash
```

### Use
```
pacu
```

## Manual Way (Build Docker Images)

### Install
```
git clone https://github.com/thirdbyte/pacu
cd pacu
chmod +x *.sh
./build.sh
```

### Use
```
./setup.sh
```

---

***GoPhish's Admin Web UI is available at https://172.16.238.4:3333. To access it from another client, use SSH local port forwarding.***
```
ssh -L 127.0.0.1:3333:172.16.238.4:3333 user@remotehost
```

Credentials: `admin`:`admin@gophish`

## Create SSL certificate

* Run the following command on the host: 

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout openai.key -out openai.crt -subj "/CN=api.openai.com"
```

## Setup Nginx proxy manager

* Log in to your Nginx Proxy Manager web panel.

* Go to SSL Certificates -> Add SSL Certificate -> Custom. Upload the `openai.crt` and `openai.key` files you created in step 1 and save.

* Go to Hosts -> Proxy Hosts and select Add Proxy Host. On the Details tab, configure the following:
- Domain Names: api.openai.com
- Scheme: http
- Forward Hostname / IP: omniroute
- Forward Port: 20128 (this is the internal port assigned to your OmniRoute container).

* On the SSL tab, expand the menu, select the Custom certificate you just imported, check the Force SSL option, and save.

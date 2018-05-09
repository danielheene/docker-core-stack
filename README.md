# docker-core-stack
A small docker-compose stack which I regularly deploy to my docker servers. 

## Services

* [portainer](https://github.com/portainer/portainer) - as management-gui 
* [watchtower](https://github.com/v2tec/watchtower) - as auto updater for containers
* [traefik](https://github.com/containous/traefik) - as load balancer
* a catch-all container based on [nginx](http://nginx.org/) and [hml5bp](https://github.com/h5bp/html5-boilerplate)'s 404-page

## Usage

After checkout run `./configure.sh` with the following arguments to configure `docker-compose.yml` and other config files:

```
  --email, -e       required email for requesting acme ssl certs
  --domain, -d      required base domain for traefik subdomain mappings
```

__Example:__

```
./configure.sh --domain=example.com --email=mail@example.com
docker-compose up -d
```

----
## License
[MIT](LICENSE)

# docker-core-stack
A small docker-compose stack which I use as basic setup for my non-production docker environments.

## Services

* [portainer](https://github.com/portainer/portainer) - as management-gui 
* [watchtower](https://github.com/v2tec/watchtower) - as auto updater for containers
* [docker-gc](https://github.com/spotify/docker-gc) - as garbage collector for docker
* [traefik](https://github.com/containous/traefik) - as reverse proxy or load balancer
* a catch-all container based on [nginx](http://nginx.org/) and [hml5bp](https://github.com/h5bp/html5-boilerplate)'s 404-page
* [ctop](https://github.com/bcicen/ctop) - as command that runs inside a container

## docker-compose

* copy `.env.example` to `.env`
* adjust containing variables
* run `make init` for creating configuration structure
* run `docker-compose up -d`

----
## License
[MIT](LICENSE)

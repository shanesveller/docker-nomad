# Usage

```shell
docker run -it --name nomad --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  shanesveller/nomad:0.2.0 agent -dev
```

```shell
docker exec -it nomad nomad node-status
```

```shell
docker exec -it nomad sh -c "nomad init && nomad run example.nomad && sleep 5 && nomad status && nomad stop example"
```

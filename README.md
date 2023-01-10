# Datadog agent for Dokku

## Deployment

This was set by a previous developer. I created this process as best as possible, but it **could not be working**.

1. On the server, create an app on Dokku: `dokku apps:create datadog`.
2. Locally, add the dokku source as a remote origin: `git remote add dokku dokku@165.22.228.152:datadog`.
3. Locally, Push to your new remote: `git push dokku master`
4. On the server, set environment variables for the app: `dokku config:set DD_API_KEY=api-key-here`
5. On the server, deactivate dokku's proxy to open the UDP port, as stated [here](https://dokku.com/docs/networking/port-management/): `dokku proxy:disable datadog`
6. In your other dokku apps, set `DD_API_KEY` and use the url `172.17.0.10:8125`. For example, in production `DATADOG_AGENT_URL=172.17.0.10:8125`.

## Development

### Build container

```
docker build -t dd-agent .
```

### Run container

```
docker run -d --name dd-agent \
    -v /Users/versoul/workspace/go/inBeat/inbeat/backend/files,:/var/log/inbeat:ro \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    -v /proc/:/host/proc/:ro \
    -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
    -e DD_API_KEY="API_KEY" \
    -p 8125:8125/udp \
    dd-agent
```

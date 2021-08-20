datadog-agent

###Build container
```
docker build -t dd-agent .
```

###Run container
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

# Load Balancing example

This project illustrates what a possible setup with HAProxy and Nginx could look
like. Requests are load balanced after they have been proxied by Nginx and are
then passed to one of two configured web servers, i.e. Node.js processes. To
illustrate the setup:

```
+--------------+          +--------------+
|              |          |              |
|  Nginx       +---------->  HAProxy     |
|              |          |              |
+--------------+          +-+----------+-+
                            |          |
                            |          |
                  +---------v--+      +v-----------+
                  |            |      |            |
                  |  Node      |      |  Node      |
                  |            |      |            |
                  +------------+      +------------+
```

Each web server supports simple HTTP endpoints to change the health status of
the web servers. This health status is recognized by HAProxy. You can set
the web server health by using the `set-health` script

```
./set-health lb-app1 false
```

Application health can be inspected via `http://$DOCKER_IP:8001`. The
load balanced application itself is available via `http://$DOCKER_IP:8000`.

## Limitations

 - only one Nginx instance
 - only one HAProxy instance
 - web servers have to be registered manually, i.e. there is no service discovery

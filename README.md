# docker-redir

Redir redirects tcp connections coming in to a local port to a specified
address/port combination.

* http://sammy.net/~sammy/hacks/

After some optimizations, this image is only 4MB size!

## Motivation

There are some cases where you want to connect to a specific port on your
parent host from a running container. This is easy to do when running docker
from the commandline with the parameter "--add-host", but when using fig this
command is not available.

The only option to add a host is to link containers so the ip of the linked
container is added to /etc/hosts

To workaround this limitation, I created this container so it's easy to
redirect any port from this container to the ip of the gateway so when it's
linked, you're actually connecting to the parent host

## Examples

### Scenario 1

You have MySQL running in your parent host and a django app using this MySQL
server. You want to run this stack using docker-compose:

```
db:
  image: fr3nd/redir
  expose:
    - "3306"
  command: redir --lport=3306 --cport=3306 --caddr=172.17.42.1
webapp:
 build: .
  command: python manage.py runserver 0.0.0.0:8000
  volumes:
    - .:/code
  ports:
    - "8000:8000"
  links:
    - db
```

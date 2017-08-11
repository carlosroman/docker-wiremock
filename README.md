Wiremock Docker File
===============

Wiremock Dockerfile for wiremock Docker builds.

### Installation

You can install the image from Docker Hub by running: `docker pull carlosroman/wiremock`

### Usage
```
   $ docker run -d -p 8080:8080 carlosroman/wiremock
```

#### Using wiremock

Once the server has started you can give it a spin by setting up a stub mapping via the JSON API:
```bash
$ curl -X POST --data '{ "request": { "url": "/get/this", "method": "GET" }, "response": { "status": 200, "body": "Here it is!\n" }}' http://localhost:8080/__admin/mappings/new
```

Then fetching it back:
```bash
$ curl http://localhost:8080/get/this
Here it is!
```

#### Shutting Down

To shutdown the server post the following using curl:

```
$ curl -X POST --data '' localhost:8080/__admin/shutdown
```

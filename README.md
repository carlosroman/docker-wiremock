Wiremock Docker File
===============

Wiremock Dockerfile for wiremock Docker builds.

### Installation

1.You can build an image from Dockerfile: `docker build -t="carlosroman/wiremock" github.com/carlosroman/docker-wiremock`

### Usage

    docker run -d -p 8080:8080 carlosroman/wiremock


#### Using wiremock

Once the server has started you can give it a spin by setting up a stub mapping via the JSON API:
```$ curl -X POST --data '{ "request": { "url": "/get/this", "method": "GET" }, "response": { "status": 200, "body": "Here it is!\n" }}' http://localhost:8080/__admin/mappings/new```

Then fetching it back:
```$ curl http://localhost:8080/get/this
Here it is!```

#### Shutting Down

To shutdown the server post the following using curl:

```curl -X POST --data '' localhost:8080/__admin/shutdown```

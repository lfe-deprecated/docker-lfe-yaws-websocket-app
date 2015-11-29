# sample-app

*An example LFE/YAWS websockets App Running on Docker*

## Introduction

This repo is featured in the
[LFE blog post]()
about running Dockerized LFE/YAWS websockets apps.


## Use

To run the Docker image you need to have docker installed and running. Then
simply run the following:

```bash
$ docker run -p 5099:5099 -t oubiwann/lfe-yaws-websockets-app:latest
```

You don't need the source code for that command; it will pull from Docker Hub.


## Builing

If you should choose to build the Docker image yourself instead of getting it
from Docker Hub:

```bash
$ git clone git@github.com:oubiwann/docker-lfe-yaws-websockets-app.git
$ cd docker-lfe-yaws-websockets-app
$ make docker-build
$ make docker-run
```

For more details, you'll just need to read the blog posts linked above ;-)

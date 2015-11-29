# websocket-app

*An example LFE/YAWS websocket App Running on Docker*


## Introduction

This repo is featured in the
[LFE blog post]()
about running Dockerized LFE/YAWS websocket apps. It is based upon the work
blogged in the previous posts:

* [Running LFE in Docker](http://blog.lfe.io/tutorials/2014/12/07/1837-running-lfe-in-docker/)
* [Update: Running an LFE YAWS app in Docker](http://blog.lfe.io/tutorials/2015/11/28/2110-lfe-yaws-docker-update/)


## Use

To run the Docker image you need to have docker installed and running. Then
simply run the following:

```bash
$ docker run -p 5099:5099 -t oubiwann/lfe-yaws-websocket-app:latest
```

You don't need the source code for that command; it will pull from Docker Hub.


## Builing

If you should choose to build the Docker image yourself instead of getting it
from Docker Hub:

```bash
$ git clone git@github.com:oubiwann/docker-lfe-yaws-websocket-app.git
$ cd docker-lfe-yaws-websocket-app
$ make docker-build
$ make docker-run
```

For more details, you'll just need to read the blog posts linked above ;-)

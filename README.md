Alice web site
==============

How to use
==========

1. run make to build a new container with content of `/website` folder.
 - this action will execute `docker build` command and use a Dockerfile located
   in this repo.
 - next step it will try to stop any running container. If the container is not
   running, it will silently ignore.
 - start a container built in step 1.
2. Navigate to [http://127.0.0.1:8080](http://127.0.0.1:8080).
3. Stop the running container with command `make stop`

Note this action is idempotent, meaning that everytime user runs this command
it will create a new container only if the content of `/website` was
changed.

Requirements
============

 - docker (tested on docker for MacOS 18.05.0)
 - make
 - bash

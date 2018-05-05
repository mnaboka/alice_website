Alice web site
==============

How to use
==========

1. Copy `jenkins_home` folder to root of this repo.
2. Build and run a CI image (jenkins) with command `make ci-start`
3. Login into jenkins web interface `[http://127.0.0.1:8080](http://127.0.0.1:8080)`
   use login/password `admin:admin`.
4. There is one job called `website-ci` which is used for Alice's CI, you can
   click on it.
  - Note that you might need to change the git repository to make it work.
    Currently it is using my own repo.
5. Push a `Build Now` button on the left panel.
6. Wait for job to complete. It should finish successfully and have a line in
   the log something line `+ docker tag alice_website:11 alice_website:latest`
7. Now the docker image named `alice_website` and tagged `latest` is available
   in your local environment.
8. All you have to do to deploy a new website is to run a command `make`.
   It is idempotent command and will use latest build from jenkins.
9. If you need to use any other image from the build just run
   `BUILD_NUMBER=2 make`. I used 2 as for the jenkins build number. But it can
   be any job you have executed on jenkins.
10. Go to `[http://127.0.0.1:8000](http://127.0.0.1:8000)` and enjoy your website.

Requirements
============

 - docker (tested on docker for MacOS 18.05.0)
 - make
 - bash

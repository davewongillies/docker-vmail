# [docker-vmail](https://hub.docker.com/r/davewongillies/vmail/)
[![](https://img.shields.io/travis/davewongillies/docker-vmail.svg)](https://travis-ci.org/davewongillies/docker-vmail) ![](https://img.shields.io/badge/vmail-v2.9.8-007EC7.svg?style=flat-square) ![](https://img.shields.io/docker/automated/davewongillies/vmail.svg) ![](https://img.shields.io/docker/build/davewongillies/vmail.svg)

## What

A docker container for running [Vmail](http://danielchoi.com/software/vmail.html), a Vim interface to Gmail.

## Requirements
1. Docker
2. A Gmail Account
3. A Google [App password](https://myaccount.google.com/apppasswords)

## Setup

### Install the container
```
# docker pull davewongillies/docker-vmail:latest
```

### Create a `.vmailrc` config file

If you don't have one already, create a default vmail profile directory

```
# mkdir -p ~/.vmail/default
```

Create a `.vmailrc` file in `~/.vmail/default`

```
username: your_email_address@gmail.com
password: google_app_password_you_generated
name: Your Name Here
signature: |
  --
  Sent from Vmail. http://danielchoi.com/software/vmail.html
```

## Usage

```
# docker run --it -rm -v ~/.vmail:/home/vmail/.vmail davewongillies/vmail:latest
```

If you have another profile under `~/.vmail` you can execute it with:

```
# docker run --it -rm -e VMAIL_HOME=~/.vmail/another_profile -v ~/.vmail:/home/vmail/.vmail davewongillies/vmail:latest
```

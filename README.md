[docker]: https://www.docker.com/get-started
[docker-compose]: https://docs.docker.com/compose/
[gitignore]: https://git-scm.com/docs/gitignore

University of Houston - Fall 2020 - COSC 3337

Repository for our COSC 3337 (Data Science I) project.

*Group 30* members:

- Carlos Flores
- Daniel Rivas
- Johanes Limano
- Martin Lopez

Possible datasets:

- https://www.kaggle.com/sudalairajkumar/covid19-in-usa
- https://www.kaggle.com/nadintamer/top-spotify-tracks-of-2018
- https://www.kaggle.com/nadintamer/top-spotify-tracks-of-2017
- https://www.kaggle.com/nadintamer/top-spotify-tracks-of-2017

- https://www.kaggle.com/jerzydziewierz/bee-vs-wasp

- https://steam.internet.byu.edu/

Spotify stats analysis for seasonal depression?

----

**Development section**

## Overview

This repository contains most of the files related to our COSC 3337 project, they
can be found under the [workspace](workspace) folder.

**Please note** that we **do not** store data in this repository, however, we
provide scripts to fetch those as needed.

## Folder and file structure

- `workspace/`: Contains most of our files directly related to our project.

- `workspace/resources`: Contains the dataset(s) used in our project.

- `docker-compose.yml`: [Docker compose][docker-compose] file that we use for
  spinning up our development environment.

- `download-resources.sh`: Scripts for downloading the dataset(s).

- `.gitignore`: [gitignore][gitignore] file to keep our repository clean. Please
  do not modify unless you know what you are doing.

## Development

For the development environment we use [Docker][docker], a really nice tool for
creating light-weight virtual machines (i.e. containers) that contain all the
required dependencies for running our Jupyter Notebooks.

The advantage of using [Docker][docker] is that all the team uses the same
environment during development, which is important for reproducing errors and
making sure everyone is using the same version for everything.

### Requirements

- [Docker][docker].

### Starting the environment

Start by making sure that Docker is running. Then from the root of this
repository run:

```
docker-compose up --build
```

Your JupyterLab environment should be accessible from:

```
localhost:8888
```

**Note** that this environment is not password protected. Be careful not to
accidentally expose it to the public internet.

### What just happened?

The commands above started a Docker container that is running Jupyter Lab and
all the other dependencies we need. The container is completely isolated from
our host machine, with the exception of the `/workspace` folder which is shared
with the container.

We share the `/workspace` with the container so that JupyterLab can access our
project files without any issues.


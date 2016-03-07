# Holodeck Docker Infrastructure
For testing purposes, the docker-compose file provisions two Holodeck servers that are linked.
One with a role of sender and the second with the role of receiver.

This requires [Docker](https://docs.docker.com) to be installed and configured.

## Running the infrastructure
Use `docker-compose up` in the same directory as the docker-compose.yml file. This will start two containers:

1. holodecka: the sender
2. holodeckb: the receiver

Connect to each container using `docker exec -ti holodecka /bin/bash` or `docker exec -ti holodeckb /bin/bash`.

To run a test:
 
1. Connect to holodecka using `docker exec -ti holodecka /bin/bash`
2. Rename `ex-mmd-push-1.processed` to `x-mmd-push-1.mmd` in the `/opt/holodeck/data/msg_out` directory.
3. Connect to holodeckb using `docker exec -ti holodeckb /bin/bash`
4. Check the directory `/opt/holodeck/data/msg_in` for the received message

See also the 'Getting Started Guide' of Holodeck.

## Dependency
The `docker-compose.yml` file depends on the `mhvdboog/holodeck` image. There are some hardcoded values
to stand-up a working test environment to send messages from sender to receiver.

Download `docker-compose.yml` and run `docker-compose up`, then follow [instructions from the Holodeck "Getting Started" guide](http://holodeck-b2b.org/documentation/getting-started/) to copy example data
from the holodeck/examples/msgs to holodeck/data/msg_out in the sender container.

# Build your own Docker Image
The Dockerfile is an example how to build an image for Holodeck.

The Dockerfile expects a binary distribution of Holodeck to be available in the `holodeck` subdirectory.

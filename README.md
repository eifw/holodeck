# Holodeck Docker Infrastructure
For testing purposes, the docker-compose file provisions two Holodeck servers that are linked.
One with a role of sender and the second with the role of receiver.

This requires [Docker](https://docs.docker.com) to be installed and configured.

## Dependency
The `docker-compose.yml` file depends on the `mhvdboog/holodeck` image. There are some hardcoded values
to stand-up a working test environment to send messages from sender to receiver.

Download `docker-compose.yml` and run `docker-compose up`, then follow [instructions from the Holodeck "Getting Started" guide](http://holodeck-b2b.org/documentation/getting-started/) to copy example data
from the holodeck/examples/msgs to holodeck/data/msg_out in the sender container.

# Build your own Docker Image
The Dockerfile is an example how to build an image for Holodeck.
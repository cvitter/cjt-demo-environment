# CloudBees Jenkins Team - Demonstration Environment

CloudBees Jenkins Team (https://www.cloudbees.com/products/cloudbees-jenkins-team) is a rock solid distribution of Jenkins that comes with support from CloudBees. This project allows you to quickly build a CloudBees Jenkins Team environment that runs within a Docker container with persistent storage mapped to a local drive. This project:

* Will install the latest Docker-ized version CloudBees Jenkins Team (found at https://hub.docker.com/r/cloudbees/cloudbees-jenkins-team/); 
* Install Maven (https://maven.apache.org/) in the container;
* And install Docker (https://www.docker.com/) in the container.

In the next section we will cover how to configure the Docker container (after you clone or download this project locally).

# Configuring

Before running CloudBees Jenkins Team for the first time you will want to update the ``docker-compose.yml`` file for your specific requirements as outlined below:

**Time Zone**:

If you would like to set time zone you can edit the following line in the ``environment`` section of the file:

`` JAVA_OPTS: "-Dorg.apache.commons.jelly.tags.fmt.timeZone=America/New_York" ``

**Ports**:

In the default configuration CloudBees Jenkins Team will be available on port ``9090`` (i.e. at ``http://localhost:9090``). You can edit the port in the following line in the ``ports`` section of the file:

`` - "9080:8080" #host:container ``

**Persistent Storage**: 

To persist your Jenkins home when the container restarts you will need to map a local volume on your machine to the Jenkins home directory on the docker container. In my environment I map Jenkins home to the ``/Users/craigvitter/Jenkins`` directory on my MacBook. You should edit that portion of the following line in the ``volumes`` section:

`` - /Users/craigvitter/JenkinsTeam:/var/jenkins_home     # Set the Jenkins home on the host machine ``

**Docker**:

The following line in the ``volumes`` section maps the docker container's sock to the host's to allow your CloudBees Jenkins Team instance to access the host's Docker installation. If your host machine has docker installed in another location edit the first path to match the local location.

`` - /var/run/docker.sock:/var/run/docker.sock        # Allow the container to run Docker on Docker ``

# Running

The first time you run CloudBees Jenkins Team using this setup you will need to build the image locally on your host. This project includes two ways to accomplish this goal. The easiest way is to simply type the following command within the project root:

``make build``

You can also use the following Docker command:

``docker-compose build``

Once the image has completed building you can run it using the following command:

``make start``

or:

``docker-compose up -d``

If you need to stop your container you can use:

``make stop``

or:

``docker-compose down`` 

# Updating

When a new version of CloudBees Jenkins Team is released the easiest way to update your Docker image is to use the following ``make`` commands:

```
make stop
make build
make start
```

to retrieve and build the lastest version.

Alternatively you could use the following Docker commands:

```
docker-compose down
docker pull jenkins/jenkins
docker-compose build
docker-compose up -d
```

# License

The content in this repository is Open Source material released under the Apache 2.0 License. Please see the [LICENSE](LICENSE) file for full license details.

# Disclaimer

The code in this repository is not sponsored or supported by Cloudbees, Inc.

# Authors and Contributors 

* Author: [Craig Vitter](https://github.com/cvitter)
 
# Questions, Feedback, Pull Requests Etc.

If you have any questions, feedback, suggestions, etc. please submit them via issues or, even better, submit a Pull Request!
 

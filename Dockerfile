FROM ubuntu:18.04

# Avoiding user interaction with tzdata when installing mongodb
# --
# Please select the geographic area in which you live. Subsequent configuration
# questions will narrow this down by presenting a list of cities, representing
# the time zones in which they are located.
# 
#  1. Africa      4. Australia  7. Atlantic  10. Pacific  13. Etc
#  2. America     5. Arctic     8. Europe    11. SystemV
#  3. Antarctica  6. Asia       9. Indian    12. US
# Geographic area: 
ENV DEBIAN_FRONTEND=noninteractive 

# Update the Ubuntu
RUN apt-get update

# Install necessary software
# make vim and git , is not necessary
RUN apt-get -y install apt-utils gnupg wget vim make git

# Install MongoDB 
# Steps from https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/
RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc |  apt-key add -
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" |  tee /etc/apt/sources.list.d/mongodb-org-4.4.list
RUN apt-get update
RUN apt-get install -y mongodb-org

# Install Golang 1.4 (Change the link accordingly)
# https://golang.org/dl/
RUN mkdir /usr/go-inst
RUN wget -c https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz -O - | tar -xz -C /usr/go-inst
RUN /usr/go-inst/go/bin/go version
ENV PATH="/usr/go-inst/go/bin:${PATH}"
RUN go version

EXPOSE 9090

# Start mongod daemon
CMD mongod
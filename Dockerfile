FROM golang:1.15

RUN apt-get update
RUN apt-get install -y git python jq curl

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update && apt-get install -y nodejs
RUN npm install gulp -g
RUN npm install yarn -g

RUN GO111MODULE=off go get -u github.com/ory/go-acc

# install schemacrawler
RUN apt-get install -y graphviz openjdk-11-jdk unzip
RUN curl -L https://github.com/schemacrawler/SchemaCrawler/releases/download/v16.11.5/schemacrawler-16.11.5-distribution.zip -o schemacrawler.zip -o schemacrawler.zip
RUN unzip schemacrawler.zip -d schemacrawler

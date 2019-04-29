FROM ubuntu:bionic

ENV LD_LIBRARY_PATH .

# Install requirements
RUN apt-get -y update; apt-get -y install curl unzip wget

# Download the server files
WORKDIR /tmp
RUN wget https://minecraft.azureedge.net/bin-linux/bedrock-server-1.11.1.2.zip

# Extract the server files
RUN mkdir /bedrock
WORKDIR /bedrock
RUN unzip /tmp/bedrock-server-1.11.1.2.zip

# Create the whitelist and permissions files
RUN touch whitelist.json; echo '[]' > whitelist.json
RUN touch permissions.json; echo '[]' > permissions.json

CMD ["/bedrock/bedrock_server"]
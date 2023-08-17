FROM --platform=linux/amd64 swift:5.8
ENV DIR=/data
WORKDIR $DIR

RUN apt -y update && \
    apt -y upgrade && \
    apt -y install autoconf automake libtool curl make g++ unzip git wget && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget -c https://github.com/protocolbuffers/protobuf/releases/download/v23.1/protoc-23.1-linux-x86_64.zip -O protoc.zip && \
    unzip ./protoc.zip -d ./protoc && \
    rm -rf ./protoc.zip && ls -alh && \
    cp ./protoc/bin/* /usr/local/bin && \
    rm -rf ./protoc

RUN wget -c https://github.com/grpc/grpc-swift/releases/download/1.16.0/protoc-grpc-swift-plugins-linux-x86_64-1.16.0.zip -O protoc-grpc-swift-plugins.zip && \
    unzip ./protoc-grpc-swift-plugins.zip -d ./protoc-grpc-swift-plugins && \
    rm -rf ./protoc-grpc-swift-plugins.zip && \
    cp ./protoc-grpc-swift-plugins/* /usr/local/bin && \
    rm -rf ./protoc-grpc-swift-plugins

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]
CMD [""]
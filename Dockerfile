# copyright 2017-2018 Regents of the University of California and the Broad Institute. All rights reserved.
FROM ubuntu:14.04
#FROM debian:jessie

COPY common/container_scripts/* /usr/local/bin/

RUN chmod ugo+x /usr/local/bin/*.sh && \
    mkdir build && \
    apt-get update && apt-get upgrade --yes && \
    apt-get install wget --yes && \
    apt-get install build-essential --yes && \
    apt-get install python-dev --yes && \
    apt-get install software-properties-common python-software-properties --yes && \
    wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip install awscli && \ 
    cd /build && \
    mkdir /build/java &&\
    cd /build/java && \
    wget https://s3.amazonaws.com/genepattern-largefile-cache/genepattern-server/resources/wrapper_scripts/docker/aws_batch/containers/Java17_oracle_jdk/jdk-7u80-linux-x64.tar.gz && \
    tar zxvf jdk-7u80-linux-x64.tar.gz && \
    rm /build/java/jdk-7u80-linux-x64.tar.gz && \
    rm /build/java/jdk1.7.0_80/src.zip && \
    rm -rf /build/java/jdk1.7.0_80/man && \
    apt-get purge wget --yes && \
    echo "Done"
#    apt-get remove --purge -y $BUILD_PACKAGES $(apt-mark showauto) && rm -rf /var/lib/apt/lists/*


# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /build/java/jdk1.7.0_80
ENV PATH $JAVA_HOME/bin:$PATH
    
#COPY common/container_scripts/* /usr/local/bin/
#RUN chmod ugo+x /usr/local/bin/runS3OnBatch.sh

 
CMD ["/usr/local/bin/runS3OnBatch.sh" ]


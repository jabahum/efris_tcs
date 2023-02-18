# Download base image ubuntu 22.04
FROM ubuntu:22.04

# LABEL about the custom image
LABEL maintainer="jabahum"
LABEL version="v1.19"
LABEL description="Docker Image for URA EFRIS (TAX CONTROL SERVICE) "

# Disable Prompt During Packages Installation
# ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
RUN apt update

#  install tcs support packages
RUN apt install  -y libaio1 numactl

# install jdk support packages
RUN apt install -y openjdk-8-jdk openjdk-8-jre

RUN apt install -y wget


ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV JRE_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre

# change time zone to local time
RUN ln -sf /usr/share/zoneinfo/Africa/Kampala /etc/localtime

# download and install tcs
RUN wget https://efristest.ura.go.ug/efrissite/www/application/EFRIS_Offline_Mode_Enabler_for_Ubuntu_V19-Test.tar.gz

RUN tar -zxvf EFRIS_Offline_Mode_Enabler_for_Ubuntu_V19-Test.tar.gz

RUN cd /TaxControlService \ ./sh tcs.sh

EXPOSE 9880 9885 9889 9980 9985 9989

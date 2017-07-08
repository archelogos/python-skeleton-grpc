FROM debian:jessie
MAINTAINER Sergio Gordillo sergio.gordillo@vizzuality.com

# Install Python build dependencies (based on Debian Build-Depends)
RUN apt-get update && apt-get install -yq \
    git \
    mercurial \
    pkg-config \
    wget \
    python-pip \
    python3.4 \
    python-dev \
    python3.4-dev \
    build-essential \
    libcurl4-openssl-dev \
    libffi-dev \
    libjpeg-dev \
    libmysqlclient-dev \
    libpng12-dev \
    libpq-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    swig \
    zlib1g-dev

# Setup locale. This prevents Python 3 IO encoding issues.
ENV LANG C.UTF-8
ENV PYTHONUNBUFFERED 1

# Name and user variables
ENV NAME app

RUN pip install --upgrade pip virtualenv

RUN mkdir -p /opt/$NAME
COPY ./ /opt/$NAME

WORKDIR /opt/$NAME

RUN virtualenv -p python3.4 venv && /bin/bash -c "source venv/bin/activate"
RUN pip install -r requirements.txt

ENV USER microservice

RUN groupadd $USER && useradd -g $USER $USER -s /bin/bash

RUN chown $USER:$USER /opt/$NAME

EXPOSE 50051

USER $USER

ENTRYPOINT ["./entrypoint.sh"]

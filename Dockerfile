FROM python:3.8.5-buster as base

MAINTAINER tomoyamkung <tsuyoshi.sugiyama@gmail.com>

WORKDIR /opt/app

COPY requirements.txt /opt/app
RUN pip3 install -r requirements.txt


FROM python:3.8.5-slim-buster as run_as_develop

WORKDIR /opt/app
COPY --from=base /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages
COPY requirements_dev.txt /opt/app
RUN pip3 install -r requirements_dev.txt

RUN apt update \
    && apt-get install make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV USER dev
ENV HOME /home/${USER}
ENV WORK_PROJECT_HOME /home/${USER}
ENV SHELL /bin/bash

RUN useradd -r -s ${SHELL} ${USER}
USER ${USER}
WORKDIR ${WORK_PROJECT_HOME}

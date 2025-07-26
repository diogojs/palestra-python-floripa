FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Sao_Paulo

RUN apt update

RUN apt install -y vim python3 python-is-python3 python3-pip wget curl

RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="$PATH:$HOME/.local/bin"

RUN /root/.local/bin/uv tool install poetry && /root/.local/bin/uv tool install pypiserver

RUN rm /usr/lib/python3.12/EXTERNALLY-MANAGED

COPY ./pip.conf /etc/pip.conf

COPY . /home/ubuntu/palestra-python

CMD ["/bin/bash"]

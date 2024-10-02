FROM debian:latest

RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip ffmpeg -y
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    npm i -g npm

COPY requirements.txt /requirements.txt
RUN pip3 install -U -r /requirements.txt

RUN mkdir /UPLOADER-BOT-V3
WORKDIR /UPLOADER-BOT-V3

CMD gunicorn app:app & python3 bot.py

FROM python:3.9-slim
LABEL maintainer="Imagames (info@imagames.com)"
RUN apt update
RUN apt install -y git
RUN mkdir /opt/app/
WORKDIR /opt/app/

RUN git clone https://github.com/jirutka/ldap-passwd-webui.git
WORKDIR /opt/app/ldap-passwd-webui
RUN pip install -r requirements.txt
RUN pip install waitress==2.0.0

ENV CONF_FILE /settings.ini

CMD waitress-serve --listen=*:8080 app:application
EXPOSE 8080/tcp

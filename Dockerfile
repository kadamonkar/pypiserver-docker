FROM python:3.4-alpine
MAINTAINER Onkar Kadam, onkar.kadam@outlook.com

EXPOSE 80

RUN pip --no-cache-dir install pypiserver==1.2.0 \
                               paste==2.0.3 \
                               pastedeploy==1.5.2 \
                               gunicorn==19.7.0 \
                               six==1.10.0 \
      -i https://pypi.python.org/simple && \
    mkdir -p /root/pypiserver/conf -m 0755 && \
    mkdir -p /root/pypiserver/packages -m 0755 

ADD ./paste.ini /root/pypiserver/conf/

CMD exec gunicorn --paste /root/pypiserver/conf/paste.ini

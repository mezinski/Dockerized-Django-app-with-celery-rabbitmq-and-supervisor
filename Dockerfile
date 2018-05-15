# use base python image with python 3.6
FROM python:3.6-alpine
RUN apk update && \
    apk add --update postgresql-dev gcc python3-dev musl-dev \
    build-base libffi-dev supervisor && \
    rm -rf /var/cache/apk/*


WORKDIR /mysite2/
# add requirements.txt to the image
ADD requirements.txt /mysite2/requirements.txt

RUN pip3 install --upgrade setuptools

# install python dependencies
RUN pip3 install -r requirements.txt

# # create unprivileged user
RUN adduser -D -g '' myuser  

ENV PYTHONPATH $PYTHONPATH:/mysite2
COPY mysite2/. /mysite2
COPY etc/supervisord.conf /etc/supervisor/supervisord.conf
EXPOSE 8000

FROM alpine:latest

RUN apk update && apk upgrade &&\
    apk add bash curl jq &&\
    mkdir -p /zoraxy/data/

COPY entrypoint.sh /zoraxy/

RUN chmod +x /zoraxy/entrypoint.sh

ENV ARGS="-port=:8000 -noauth=false"

EXPOSE ${PORT}

ENTRYPOINT ["/zoraxy/entrypoint.sh"]
FROM alpine:latest

EXPOSE 5000
RUN apk update && apk upgrade --no-cache
RUN apk add bash git curl jq python3 notmuch py3-notmuch py3-pip --no-cache

RUN python3 -m pip install --break-system-packages netviel
COPY notmuch-config /root/.notmuch-config
COPY run.sh /run.sh
RUN chmod +x /run.sh
RUN mkdir /mounted

CMD [ "./run.sh" ]
ENTRYPOINT [ "./run.sh" ]
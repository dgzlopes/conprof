FROM alpine:3.12

WORKDIR /conprof

COPY conprof                  /bin/conprof
COPY examples/conprof.yaml    /etc/conprof/config.yaml

RUN apk add --no-cache graphviz \
    && chown -R nobody:nogroup /etc/conprof /conprof

USER       nobody
EXPOSE     10902
ENTRYPOINT [ "/bin/conprof" ]
CMD        [ "all", \
             "--storage.tsdb.path=/conprof", \
             "--config.file=/etc/conprof/config.yaml" ]

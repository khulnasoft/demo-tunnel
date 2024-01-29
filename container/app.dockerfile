FROM alpine:3.19.1
RUN adduser -D -g '' appuser
USER appuser
CMD sh -c 'sleep 1d'%

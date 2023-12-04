FROM alpine:latest
COPY --from=goreleaser/goreleaser:v0.184.0 /usr/local/bin/ /my
FROM alpine:latest
COPY --from=goreleaser/goreleaser:v1.23.0 /usr/local/bin/ /my
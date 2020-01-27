FROM golang:1.13-alpine AS go

FROM znly/protoc

COPY --from=go /usr/local/go/ /usr/local/go/

RUN apk add --update --no-cache git

ENV PATH /usr/local/go/bin:$PATH

RUN go  get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger;

ENTRYPOINT [ "protoc" ]

# FROM golang as go
# FROM znly/protoc

# RUN apk add --update --no-cache vim git make musl-dev go curl

# RUN ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn \
#   && ln -s /opt/yarn/bin/yarn /usr/local/bin/yarnpkg

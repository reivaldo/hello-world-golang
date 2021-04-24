FROM golang:1.15-alpine3.13 AS build

WORKDIR /src/
COPY main.go go.* /src/
RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /bin/codeeducation

FROM scratch
COPY --from=build /bin/codeeducation /bin/codeeducation
ENTRYPOINT ["/bin/codeeducation"]
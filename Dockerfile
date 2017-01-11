FROM golang
MAINTAINER Clayton Hynfield "clayton.hynfield@kroger.com"

#RUN go get github.com/cloudfoundry/cf-smoke-tests
#RUN go get stash.kroger.com/cls/platform-smoke-tests

ENTRYPOINT '/bin/bash'
CMD echo PASSWORD: [$PASSWORD]

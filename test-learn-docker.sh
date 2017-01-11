#!/usr/bin/env bats

short_sha=$( date +%Y%m%d%H%M%S$RANDOM | sha256sum | awk '{ print substr($1, length($1) - 5) }' )
image_name="learn-docker-$short_sha"

setup() {
  docker build -t "$image_name" .
}

@test 'pass password into container' {
  export PASSWORD=zoofle
  run docker run -e PASSWORD "$image_name"
  [ "$status" -eq 0 ]
  [ $( expr "$output" : "$PASSWORD" ) -eq 0 ]
}

teardown() {
  test_containers=$( docker ps --all --quiet --filter "ancestor=$image_name" )
  for container in $test_containers; do
    docker stop "$container"
    docker rm "$container"
    docker rmi "$image_name"
  done
}

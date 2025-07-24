FROM ubuntu:22.04

RUN apt update && apt install -y \
    g++ \
    bazel \
    && rm -rf /var/lib/apt/lists/*

COPY . /app
WORKDIR /app

RUN bazel build //:hello_world

CMD ["bazel-bin/hello_world"]

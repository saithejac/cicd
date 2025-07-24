# FROM ubuntu:22.04

# RUN apt update && apt install -y \
#     g++ \
#     bazel \
#     && rm -rf /var/lib/apt/lists/*

# COPY . /app
# WORKDIR /app

# RUN bazel build //:hello_world

# CMD ["bazel-bin/hello_world"]
FROM ubuntu:22.04

# Set environment variables for non-interactive install
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    zip \
    unzip \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Install Bazelisk (preferred Bazel installer)
RUN curl -Lo /usr/local/bin/bazel https://github.com/bazelbuild/bazelisk/releases/latest/download/bazelisk-linux-amd64 && \
    chmod +x /usr/local/bin/bazel

# Create app directory
WORKDIR /app

# Copy source files
COPY . .

# Optional: specify Bazel version using .bazelversion
# RUN echo "8.3.1" > .bazelversion

# Build the C++ binary using Bazel
RUN bazel build //:hello_world

# Run the compiled binary by default
CMD ["./bazel-bin/hello_world"]

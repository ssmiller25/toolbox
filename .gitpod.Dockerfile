# You can find the new timestamped tags here: https://hub.docker.com/r/gitpod/workspace-full/tags
FROM gitpod/workspace-full:2022-06-20-19-54-55

# Install custom tools, runtime, etc.
RUN brew tap civo/tools && \
    brew install act terraform civo awscli
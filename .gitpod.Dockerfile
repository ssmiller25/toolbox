# You can find the new timestamped tags here: https://hub.docker.com/r/gitpod/workspace-full/tags
FROM gitpod/workspace-full:2022-07-22-21-28-39

# Install custom tools, runtime, etc.
RUN brew install act terraform awscli kubernetes-cli

# Civo CLI ... need to debug why this isn't working in docker build later...
# RUN brew tap civo/tools && \
#     brew install civo
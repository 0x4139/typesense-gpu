ARG CUDA_VERSION=12.2.2-cudnn8-runtime-ubuntu22.04
FROM nvidia/cuda:${CUDA_VERSION}
# Declaring the version of typesense to install after FROM because FROM "eats" the ARG values
ARG TYPESENSE_VERSION=26.0

# Debugging output to ensure the versions are correctly set
RUN echo "TYPESENSE_VERSION is ${TYPESENSE_VERSION}"
RUN echo "CUDA_VERSION is ${CUDA_VERSION}"

# Install dependencies
RUN apt update && apt install -y curl sudo ca-certificates systemctl

# Install typesense
RUN curl -O "https://dl.typesense.org/releases/${TYPESENSE_VERSION}/typesense-server-${TYPESENSE_VERSION}-amd64.deb" && \
    sudo apt install -y ./typesense-server-${TYPESENSE_VERSION}-amd64.deb

# Set cuda paths
ENV PATH="/usr/local/cuda/bin:${PATH}"
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/cuda/lib64"
ENV CUDA_HOME="/usr/local/cuda"

RUN curl -O "https://dl.typesense.org/releases/${TYPESENSE_VERSION}/typesense-gpu-deps-${TYPESENSE_VERSION}-amd64.deb" && \
    sudo apt install -y ./typesense-gpu-deps-${TYPESENSE_VERSION}-amd64.deb

ENTRYPOINT [ "/bin/typesense-server" ]

#!/bin/bash

# Define variables
TYPESENSE_VERSION="28.0"
DOCKER_USERNAME="0x4139"
IMAGE_NAME="typesense-gpu"
CUDA_VERSIONS=("11.8.0-cudnn8-runtime-ubuntu22.04")

# Loop through each CUDA version, build and push the Docker image
for CUDA_VERSION in "${CUDA_VERSIONS[@]}"; do
    TAG="${TYPESENSE_VERSION}-cuda${CUDA_VERSION}"
    FULL_IMAGE_NAME="${DOCKER_USERNAME}/${IMAGE_NAME}:${TAG}"

    echo "Building Docker image for CUDA version ${CUDA_VERSION}..."
    docker build --build-arg TYPESENSE_VERSION="${TYPESENSE_VERSION}" --build-arg CUDA_VERSION="${CUDA_VERSION}" -t "${FULL_IMAGE_NAME}" .

    if [ $? -eq 0 ]; then
        echo "Successfully built ${FULL_IMAGE_NAME}"
    else
        echo "Failed to build ${FULL_IMAGE_NAME}"
        exit 1
    fi

    echo "Pushing Docker image ${FULL_IMAGE_NAME} to Docker Hub..."
    docker push "${FULL_IMAGE_NAME}"

    if [ $? -eq 0 ]; then
        echo "Successfully pushed ${FULL_IMAGE_NAME}"
    else
        echo "Failed to push ${FULL_IMAGE_NAME}"
        exit 1
    fi
done

echo "All images have been built and pushed successfully."

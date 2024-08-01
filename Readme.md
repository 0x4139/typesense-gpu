# typesense-gpu

[![Docker Build Status](https://img.shields.io/docker/build/0x4139/typesense-gpu.svg)](https://hub.docker.com/r/0x4139/typesense-gpu)

A Docker setup for running [Typesense](https://typesense.org/) with GPU support using the NVIDIA Container Toolkit.

## Table of Contents
- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Running the Service](#running-the-service)
- [Modifying Versions](#modifying-versions)
- [Environment Variables](#environment-variables)
- [GPU Requirements](#gpu-requirements)
- [Contributing](#contributing)
- [License](#license)

## Introduction

This repository provides a Docker setup for running Typesense with GPU support. It leverages the NVIDIA Container Toolkit to utilize the GPU for Typesense operations.

## Prerequisites

Before you start, ensure you have the following installed:

- Docker
- Docker Compose
- NVIDIA Container Toolkit
- NVIDIA Drivers (compatible with your CUDA version)

## Installation

Clone the repository:

```bash
git clone https://github.com/0x4139/typesense-gpu.git
cd typesense-gpu
```

## Running the Service

To start the Typesense service, run the following command:

```bash
docker-compose up -d
```

This command will build and run the Typesense container with GPU support.

## Modifying Versions

You can specify different versions of Typesense and CUDA by modifying the `.env` file in the repository. Create a `.env` file in the root directory if it doesn't exist and add the following content:

```
TYPESENSE_VERSION=your_typesense_version
CUDA_VERSION=your_cuda_version
API_KEY=your_api_key
```

Replace `your_typesense_version`, `your_cuda_version`, and `your_api_key` with the desired versions and API key.

## Environment Variables

The following environment variables can be configured in the `.env` file:

- `TYPESENSE_VERSION`: The version of Typesense to use.
- `CUDA_VERSION`: The version of CUDA to use.
- `API_KEY`: The API key for Typesense.

## GPU Requirements

Ensure you have the NVIDIA Container Toolkit installed and configured. Follow the [NVIDIA Container Toolkit Installation Guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html) to set up the toolkit.

Additionally, make sure your system has the appropriate NVIDIA drivers installed that are compatible with your desired CUDA version.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss any changes or enhancements.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

By following these instructions, you should be able to successfully run Typesense with GPU support on your machine. If you encounter any issues, feel free to open an issue in the repository.
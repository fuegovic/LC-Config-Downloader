# LibreChat.yaml Config Downloader

## ⚠️Deprecated!⚠️
- You can now specify a URL for the LibreChat config using the environment variable `CONFIG_PATH=`.
- If you need some ready-to-use config examples, check out: https://github.com/fuegovic/lc-config-yaml

---
---
---

LC Config Downloader is a tool designed to facilitate the remote management of the LibreChat configuration file (`librechat.yaml`). It works by downloading a specified `librechat.yaml` file into a shared Docker volume, from where it can be utilized by the LibreChat container. This tool is particularly useful for scenarios requiring remote or automated configuration updates, and it supports integration with Portainer and standard Docker setups.

- [Features](#features)
- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Configuration](#configuration)
    - [Environment Variables](#environment-variables)
    - [Docker Compose Setup](#docker-compose-setup)
        - [Standard Docker Installation](#standard-docker-installation)
        - [Portainer Setup](#portainer-setup)
    - [Usage](#usage)   

## Features

- Download `librechat.yaml` from a specified URL.
- Easy integration with Docker and Portainer setups.
- Uses environment variables for easy customization.
- Supports fallback to a default example configuration.

## Getting Started

To use LC Config Downloader, you'll need a Docker environment ready. The script is packaged in a Docker container for easy deployment alongside your LibreChat setup.

### Prerequisites

- Docker and Docker Compose installed on your machine.
- Basic knowledge of Docker and container management.

### Configuration

#### Environment Variables

- `CONFIG_URL` – The URL from which the `librechat.yaml` file should be downloaded. If not provided, a default example configuration will be used.

#### Docker Compose Setup

Here's how you can set it up using Docker Compose for both standard Docker installations and Portainer:

#### Standard Docker Installation

1. Create a `docker-compose.override.yaml` file in your project directory.
2. Use the following template and adjust values as necessary:

    ```yaml
    version: "3.4"
    services:
      api:
        volumes:
          - shared-config:/app
      config-downloader:
        container_name: ConfigDownloader
        image: ghcr.io/fuegovic/lc-config-downloader:latest
        env_file:
          - .env
        volumes:
          - shared-config:/shared
    volumes:
        shared-config:
    ```
3. Add `CONFIG_URL=https://my-custom-url-to/librechat.yaml` to your LibreChat `.env` file. 

4. **Note:** Update the URL with your own. If you prefer to add the URL directely in this compose file you can use:
```
        environment:
          - CONFIG_URL=https://my-custom-url-to/librechat.yaml
```
and **remove:**
```
        env_file:
          - .env
```

#### Portainer Setup

1. Define your stack in Portainer using the following configuration, adjusting as necessary:

    ```yaml
    version: "3.8"
    services:
      # LibreChat
      api:
        image: ghcr.io/danny-avila/librechat-dev:latest
        container_name: LibreChat
        ports:
          - 3080:3080
        restart: always
        env_file:
          - stack.env
        volumes:
          - /LibreChat/images:/app/client/public/images
          - shared-config:/app
      # Config Downloader
      config-downloader:
        container_name: ConfigDownloader
        image: ghcr.io/fuegovic/lc-config-downloader:latest
        env_file:
          - stack.env
        volumes:
          - shared-config:/shared
      # Meilisearch (Optional)
      meilisearch:
        container_name: Meilisearch
        image: getmeili/meilisearch:v1.5.1
        restart: always
        env_file:
          - stack.env
        volumes:
          - /LibreChat/meili_data_v1.5:/meili_data
    volumes:
        shared-config:
    ```
2. Add `CONFIG_URL=https://my-custom-url-to/librechat.yaml` to your stack environment variables. 

3. **Note:** Update the URL with your own. If you prefer to add the URL directely in this compose file you can use:
```
        environment:
          - CONFIG_URL=https://my-custom-url-to/librechat.yaml
```
and **remove:**
```
        env_file:
          - stack.env
```

### Usage

Deploy your configuration using Docker Compose:

```sh
docker-compose up -d
```

For Portainer, add the configuration as a new stack and deploy it.

---

Remember to replace placeholders (like the config file URL) with actual values relevant to your setup. This README is a starting point, and you should adjust it to fit the specifics and requirements of your project more accurately.

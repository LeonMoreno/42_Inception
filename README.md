# Docker Infrastructure Project

In this project, I significantly expanded my skills in system administration by configuring a comprehensive infrastructure using Docker. I deployed multiple services in Docker containers using docker-compose, ensuring adherence to strict configuration and deployment rules.

![image](https://github.com/LeonMoreno/42_Inception/assets/88601147/ca6de83b-e1ab-4c0b-b5b1-e5377ed1b68c)


## Overview

Throughout this project, I achieved the following:

- Utilized `docker-compose` to efficiently manage the configuration and deployment of containers.
- Implemented custom Dockerfiles for each service, ensuring that each Docker image was built from scratch using the penultimate stable version of Alpine Linux.
- Manually built Docker images, avoiding reliance on pre-built images from DockerHub (with the exception of Alpine).
- Configured key services including NGINX with TLS support, WordPress with php-fpm and Redis for caching, MariaDB for database management, a pure-ftpd FTP server, a static website, and Adminer for easy database management.

### Makefile Integration -- How to Run

The project utilizes a Makefile to orchestrate Docker Compose operations effectively. Below are key targets defined in the Makefile:

- `make` -- Build and start containers in detached mode

- `make down` -- Stop and remove containers

- `make clean` -- Stop and remove containers, and also remove all images
 
- `make vclean` -- Remove Docker volumes
 
- `make fclean` -- Remove containers, images, and volumes
 
- `make prune` -- Clean up unused Docker resources

## Project Components

During implementation, I configured:

- A Docker container for NGINX with exclusive support for TLSv1.2 or TLSv1.3.
- A separate Docker environment for WordPress with php-fpm and Redis, optimized to efficiently manage site caching.
- A Docker container for MariaDB, providing the necessary database backend for the site.
- Dedicated volumes for storing the WordPress database and site files.
- A Docker network to connect all services and ensure effective communication between them.
- A pure-ftpd FTP server integrated with the WordPress site file volumes for easy file management.
- Deployment of a simple static website to complement the environment.
- Utilization of Adminer, a dedicated Docker container for easy management and administration of databases.

## Deployment Requirements and Best Practices

To ensure robust deployment and adherence to best practices, the following guidelines have been implemented:

- **Avoidance of Latest Tag**: Docker images do not utilize the `latest` tag to maintain consistency and stability. Instead, specific versions or stable tags are employed for all images.

- **No Passwords in Dockerfiles**: Dockerfiles are configured to exclude passwords. Authentication credentials and sensitive information are managed exclusively through environment variables.

- **Mandatory Use of Environment Variables**: Services are configured using environment variables. These variables encompass sensitive data such as database passwords, API keys, and configuration settings.

- **Use of .env File**: Environment variables are stored in a `.env` file located at the root of the `srcs` directory. Docker Compose sources this file to provide necessary configurations across the environment.

- **NGINX as Single Entry Point**: The NGINX container serves as the exclusive entry point into the infrastructure, accessible solely via port 443 (HTTPS). The server supports TLSv1.2 or TLSv1.3 protocols to ensure secure communication.



## Project Achievements

- Develop advanced skills in configuring and managing Docker containers.
- Implement optimal practices to ensure the performance and security of deployed services.
- Learn resource optimization and efficiency in Docker-based system management.
- Gain comprehensive experience in setting up modern infrastructures using the latest available technologies.

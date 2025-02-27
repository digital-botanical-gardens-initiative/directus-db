# Archived !

Please refer to the now splitted repos :

- https://github.com/digital-botanical-gardens-initiative/Directus-prod
- https://github.com/digital-botanical-gardens-initiative/Directus-dev
- https://github.com/digital-botanical-gardens-initiative/directus-backup

------




# DBGI Directus instance

This repository contains a Docker Compose setup for a Directus instance for the DBGI sample handling. This setup is temporary (longer term solution is beeing built at https://github.com/earth-metabolome-initiative/emi-monorepo). To get started, follow the instructions below.

## Prerequisites

Before you begin, make sure you have the following prerequisites installed:

- Docker: [Install Docker](https://docs.docker.com/get-docker/)
- Docker Compose: [Install Docker Compose](https://docs.docker.com/compose/install/)

## Setup

1. Clone the repository to your local machine:

```bash
git clone https://github.com/digital-botanical-gardens-initiative/directus-db.git
cd directus-db
```

2. Create a .env file in the root directory of your project. Use this file to store your sensitive data, such as database credentials and application secrets.

3. Open the .env file in a text editor and add the following variables, replacing the placeholders with your actual credentials and settings:

```sh
# Database credentials
POSTGRES_USER=your_postgres_user
POSTGRES_PASSWORD=your_postgres_password
POSTGRES_DB=your_postgres_db

# Directus service credentials
DIRECTUS_DB_CLIENT=pg
DIRECTUS_DB_HOST=your_database_host
DIRECTUS_DB_PORT=5432
DIRECTUS_DB_DATABASE=directus
DIRECTUS_DB_USER=your_directus_user
DIRECTUS_DB_PASSWORD=your_directus_password

# Other environment variables for Directus
KEY=your_directus_key
CACHE_ENABLED=true
CACHE_STORE=redis
REDIS=redis://cache:6379
PUBLIC_URL=https://directus.example.com
```

Replace the values with your actual credentials and configuration details.


## Deployment

To deploy the application, run the following Docker Compose command:

```sh
docker-compose up -d
```

Note: using the latest Directus image you might need to launch this command several time see https://github.com/directus/directus/issues/20542

This command will start the necessary services, including the database and your application.

## Accessing Your Application

Once the deployment is complete, you can access your application by opening a web browser and navigating to http://localhost:8056 (or the appropriate URL as per your configuration).


## Stopping and Cleaning Up

To stop the application and remove the containers, run the following command:

```sh
docker-compose down
```

## Contributing

If you would like to contribute to this project or report issues, please follow our contribution guidelines.

## License

see the LICENSE.md file for details.

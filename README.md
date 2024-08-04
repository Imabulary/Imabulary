<h1 align="center">
  <a href="https://www.imabulary.app/">
    <img src="docs/design/logo.png" alt="Logo">
  </a>
</h1>

<h3>
  Imabulary - the whole world is your dictionary!
</h3>

<details open="open">
<summary>Contents</summary>

- [About](#about)
- [Built With](#built-with)
  - [Mobile client](#mobile-client)
  - [Backend](#backend)
  - [Infrastructure](#infrastructure)
- [Usage](#usage)
  - [Start a local development](#start-a-local-development)
- [Project structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)

</details>

## About

Imabulary helps to develop a long-term memory when it comes to learning new words and phrases in a foreign language. It allows users to take a picture or choose one from gallery and the tool will provide an instant description and translation of the item on the picture in your target language.

## Built With

### Mobile client

- [Dart](https://dart.dev/)
- [Flutter](https://flutter.dev/)

### Backend

- [Node.js](https://nodejs.org/)
- [Nest.js](https://nestjs.com/)
- [PostgreSQL](https://www.postgresql.org/)

### Infrastructure

- [Docker](https://www.docker.com/)
- [Google Cloud Platform](https://cloud.google.com/)

## Usage

### Start a local development

1. Make sure that Docker and `docker-compose` tools are installed on your local device.
2. Create all required `.env` files to start the project. [How to work with `.env` files](docs/SECURITY.md).
3. In the root of the `server` directory create 2 files `admin-account.json` and `service-account.json`. The content of those files you can find in our password manager [vault](https://vault.bitwarden.com/#/vault). 
4. Populate the project's CLI commands by running `source scripts.sh` in the terminal being in the root directory of the project. Yes, you have to have a UNIX-based machine or environment.
5. Run the `devBuild` command in the terminal. By doing it, you start a backend and database using Docker, so make sure that the Docker daemon is running on your machine.
6. To start a mobile app, you have to have either an emulator running on your device or a real device connected to your machine. Then run `flutter run` in the terminal and choose your preferred device.

## Project structure

- `docs/` - project documentation
- `mobile/` - source code of mobile app
- `server/` - source code of the backend
- `.github/` - GitHub configs

## Contributing

Please see: [CONTRIBUTING.md](docs/CONTRIBUTING.md)

## License

_TBD_

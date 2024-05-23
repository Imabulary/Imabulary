# Security policy for `.env` files and GitHub Actions

## Working with `.env` files locally

1. All required `.env` keys are stored inside the `.env.example` of each working directory
2. Take all the keys and fill them with the values
3. Please be careful not to accidentally commit a `.env` file, even though it's in `.dockerignore`.
4. When you add a new key to the `.env` file, please also update the `.env.example`.

## Using secrets for deployment via GitHub Actions

When deploying, use GitHub Actions secrets to save and use settings from `.env` files securely. GitHub secrets are source of truth when it comes to storing sensitive values in a production environment.

# Security policy for `.env' files and GitHub Actions

## Working with `.env' files locally

1. All required `.env` keys are stored inside the `.env.example` of each working directory
2. Take all the keys and fill them with the values
3. Please be careful not to accidentally commit an `.env` file, even though it's in `.dockerignore`.
4. When you add a new key to the `.env` file, please don't forget to update the `.env.example` as well.

## Using secrets for deployment via GitHub Actions

When deploying, use GitHub Actions secrets to securely save and use settings from `.env` files. GitHub secrets is source of truth when it comes to storing sensetive values in production environment

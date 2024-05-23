# Changelog

## [MVP]

### Added

- Added steps to create `service-account.json` and `admin-account.json` files from GitHub secrets using `jsdaniell/create-json@v1.2.3`.

### Changed

- Replaced build number with a short commit hash (`SHORT_SHA`) in the instance name and Docker image tag.
- Updated `prodBuildPushGCR` function to use `SHORT_SHA` instead of build number for tagging and pushing Docker images.
- Added steps to update `server/.env` with parameters from GitHub secrets, including `PORT`, `POSTGRES_PASSWORD`, `POSTGRES_USER`, `POSTGRES_DB`, `DATABASE_URL`, `STORAGE_URL`, and `PROJECT_ID`.
- Moved the setting of `SHORT_SHA` to a global environment variable for subsequent usage in the deployment script.

### Security

- Removed hardcoded `PROD_IP` from the script and added it as a GitHub secret to enhance security.
- Ensured that all secrets are accessed securely from GitHub secrets and not hardcoded in the deployment script.

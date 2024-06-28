# Backend Overview

The app is written using [Node.js](https://nodejs.org/) with [Nest.js](https://nestjs.com/) framework. The architecture is the modular monolith. [PostgreSQL](https://www.postgresql.org/) - the main database.

## Project Structure

- `src/` - source code
- `prisma/` - Prisma ORM schema and SQL migrations

## Modules

- `assistant` - Google Vertex AI which uses Gemini model to generate phrases based on words
- `decorators` - Decorators to extend the behavior of some functions, classes, etc.
- `filters` - Filters to catch application errors
- `flashcards` - Module to work with flashcards (create them, fetch, update, delete, etc.)
- `guards` - Guards to protect API endpoints from unauthorized access
- `interceptors` - Interceptors to transform controller responses before they're sent
- `pipes` - classes for transforming request data
- `prisma` - Prisma ORM module
- `sets` - Module to work with sets (create them, fetch, update, delete, etc.)
- `shared` - code which is used by a couple of modules at the same time. Usually it's something static like constants and types
- `storage` - module to work with Firebase Storage
- `translator` - module to work with Google Translate API
- `users` - module to work with users (create them, read their info, etc.)
- `utils` - place where we store some handy functions that might be used in different places and modules of the app
- `vision` - a module to work with Google Cloud Vision API
- `wallet` - a module to work with wallet and payment system
- `awards` - a module to work with awards for wallet
- `cashback` - a module to work with cashback system

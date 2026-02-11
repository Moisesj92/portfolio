# Portfolio Blog

A Rails monolith for publishing ideas, projects, and experiments. It ships with a
minimal admin area, clear content workflow (draft vs published), and a bold UI
powered by Tailwind + Hotwire.

## Features

- Public blog with categories and scheduled publishing
- Admin-only CRUD for posts and categories
- Draft vs published status with published_at validation
- Tailwind UI and Hotwire defaults
- PostgreSQL and Solid Cache/Queue/Cable

## Tech stack

- Rails 8.1
- PostgreSQL
- Tailwind CSS (tailwindcss-rails)
- Turbo + Stimulus (importmap)

## Local setup

1. Install gems:

   ```bash
   bundle install
   ```

2. Prepare the database:

   ```bash
   bin/rails db:prepare
   ```

3. Run tests:

   ```bash
   bin/rails test
   ```

4. Start the server:

   ```bash
   bin/rails server
   ```

## Docker Compose (PostgreSQL)

1. Ensure Rails credentials are set and `config/master.key` exists locally.
   - Edit credentials with `bin/rails credentials:edit`.
2. Docker Compose mounts `config/master.key` as a secret into the container.
   - Optional: update `ACTION_CABLE_ALLOWED_REQUEST_ORIGINS` in `docker-compose.yml`.
3. Build and start services:

   ```bash
   docker compose up --build
   ```

4. Visit http://localhost:3000.

Notes:

- The `blog` service runs Rails in production mode and exposes port 3000.
- The database persists in the `postgres_data` volume.

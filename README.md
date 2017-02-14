# Setup

* Install Phoenix - `mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez`
* Install [Postgres](https://postgresapp.com/)
* Install Node >= 5.0

```sh
# Accept installation of dependencies
mix deps.get
npm install
# Will compile your app
mix ecto.migrate
# Start the app
mix phoenix.server
```

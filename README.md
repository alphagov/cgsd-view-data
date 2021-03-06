# Service Performance – View Data

This is the frontend application for viewing Service Performance data. It communicates with the [`gsd-api`](https://github.com/alphagov/gsd-api) application to retrieve the data.

## Setup

First you need the Ruby version defined in [`.ruby-version`](https://github.com/alphagov/gsd-view-data/blob/master/.ruby-version) installed, which is currently `2.4.1`. It's easy to switch Ruby versions on demand with [`rbenv`](http://rbenv.org/), which you can do using [`Homebrew`](https://brew.sh/).

```
brew install rbenv
```

If you have rbenv installed, you can run

```
rbenv install 2.4.1
```

Next, you'll need [`Bundler`](http://bundler.io/) in order to install all the dependencies you'll need to run the app.

```
gem install bundler
```

Installing Bundler means that you have it for the current version of Ruby. If you ever switch Ruby versions, you'll need to re-install Bundler.
After bundle has been installed, install the dependencies for this application with

```
bundle
```

Once you have all the dependencies, you need to start the server.

1. You can check out [`Pow`](http://pow.cx/) for a really easy no-config server solution.
2. You can do the more conventional `rails -s` command. If you're already running another app on port 3000 (the API, for example), then pass in a new port number with `rails -s --port 3000`

Create a `.env` file by copying [`.env.example`](https://github.com/alphagov/gsd-view-data/blob/master/.env.example) and then make sure `API_URL` is pointing at the same place where the API is running and you should be good to go. 😎👍

## Tests

### Frontend test setup

Make sure you have [`npm`](https://www.npmjs.com/get-npm) installed, as well as a relatively recent version of [`node`](https://nodejs.org/en/).

[`nvm`](https://github.com/creationix/nvm) is a pretty good way of installing different `node` versions. Follow [the installation instructions from the `nvm` repository](https://github.com/creationix/nvm#installation) and afterwards install all the node versions you could ever want. Installing a node version is as easy as

```
nvm install 6.11.0
```

There's [an `.nvmrc` file](https://github.com/creationix/nvm#nvmrc) in the root directory of this repository that `nvm` will recognise when you call certain commands (like `nvm use`) without arguments.

To install the frontend dependencies, run

```
npm install
```

### Frontend tests

#### linting

At [GDS](https://github.com/alphagov/styleguides/blob/master/js.md#linting), we use [`standardjs`](https://standardjs.com/).

```
npm run lint
```

Running `npm run lint` will lint the javascript files it finds in the `app/assets/javascripts/*` directory. It gives you some scary-looking npm error trace, but also plain-english messages about what's gone wrong.

#### unit tests

We're using [Jest](https://facebook.github.io/jest/) for JavaScript unit tests.

```
./script/run-npm-test
```

Running `./script/run-npm-test` will run any javascript test files it finds across the whole codebase.

### Installing capybara-webkit

The `capybara-webkit` gem relies on `qt v5.5`. To install the gem:

    brew install qt@5.5
    export PATH="/usr/local/opt/qt@5.5/bin:$PATH"
    bundle install

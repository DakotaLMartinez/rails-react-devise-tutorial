# README

This README covers how to set up a Rails/React app for User authentication using Devise

- Set up Webpacker 
- Generate the client app with create-react-app
- configure webpacker to read from create-react-app
- add a home route and a route to mount the react app
- install devise and set up user logins
- check for authentication before rendering the react view
- create a posts resource and some seeds
- add react router and a posts index that pulls the current user's posts
- and link to a new post component
- configure new post component to pull csrf token from view and add to headers on fetch request

## My Environment

Ruby Version: 2.6.1,
Node Version: 12.1.0,
Mac OS 10.12.6


## Set up Webpacker

We'll want to add webpacker to the gemfile

```
gem 'webpacker'
```
and run `bundle install`. Then we'll do 
```
rails webpacker:install
```


## Generate the client app with create-react-app

Now we'll want to generate the client app

```
create-react-app client
```
After this, make sure to add this to your .gitignore file at the root so the repo doesn't have all your node_modules in client:
```
# .gitignore
/client/node_modules
```

## Configure Webpacker to Read From create-react-app

To get webpacker working with create-react-app, you'll want to change the first couple of lines of the default configuration in `config/webpacker.yml` from:
```
default: &default
  source_path: app/javascript
  source_entry_path: packs
```

to:
```
default: &default
  source_path: client
  source_entry_path: src
```
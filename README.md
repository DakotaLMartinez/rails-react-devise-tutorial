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



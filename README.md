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
Finally, we'll want some of the configuration we get from installing webpacker for react, so let's do
```
rails webpacker:install:react
```
We'll keep all of the changes except for the hello_react component.


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
We'll also want to remove all references to serviceworker in index.js so it looks like this:
```
import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';


ReactDOM.render(<App />, document.getElementById('root'));


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

## Add a Home Route and a Route to Mount The React App

We'll generate a welcome controller with a couple of actions to handle a home page and also our react app.

```
rails g controller welcome home app --no-assets --no-helper
```

We'll set up the routes like this:
```
Rails.application.routes.draw do
  get 'welcome/home'
  get '/app', to: 'welcome#app', as: 'app'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
end
```
Then we'll add a link from the home view to the app view.
```
# app/views/welcome/home.html.erb
<h1>Welcome#home</h1>
<p>If you're logged in, check out <%= link_to "the app", app_path %>!</p>
```
Finally, we'll add the code we need to mount the react app in the app view:
```
# app/views/welcome/app.html.erb
<div id="root"></div>
<%= javascript_pack_tag 'index' %>
```
Now, let's check it out in the browser, if you click the link you should see create-react-app's landing page

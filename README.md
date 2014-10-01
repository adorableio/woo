# Woo
[![Build Status](https://travis-ci.org/adorableio/woo.svg?branch=master)](https://travis-ci.org/adorableio/woo)

The Woo stylguide integrates with your Rails app, using your existing css.

## Setup

### Add the Gem

```ruby
# Gemfile
gem 'woo'
```

### Mount the Woo Engine

```ruby
# config/routes.rb
mount Woo::Engine, at: '/styleguide'
```

## Generators

Woo features 2 generators to create views used within the styleguide.

### Pages
Creates `app/views/styleguide/DIRECTORY/NAME.html.haml`

If `DIRECTORY` is not specified, it will default to 'pages'.

```
rails generate woo:page [DIRECTORY/]NAME
```

### UI Elements
Creates `app/views/styleguide/ui_elements/_NAME.html.haml`

UI Elements are rendered as partials rather than individual pages.

```
rails generate styleguide:ui_element NAME
```

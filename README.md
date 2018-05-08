## AngularJS-style CSRF Protection for Rails

[![Gem Version](https://badge.fury.io/rb/angular_rails_csrf.svg)](https://badge.fury.io/rb/angular_rails_csrf)
[![Build Status](https://travis-ci.org/jsanders/angular_rails_csrf.png)](https://travis-ci.org/jsanders/angular_rails_csrf)

The AngularJS [ng.$http](http://docs.angularjs.org/api/ng.$http) service has built-in CSRF protection. By default, it looks for a cookie named `XSRF-TOKEN` and, if found, writes its value into an `X-XSRF-TOKEN` header, which the server compares with the CSRF token saved in the user's session.

This project adds direct support for this scheme to your Rails application without requiring any changes to your AngularJS application. It also doesn't require the use of `csrf_meta_tags` to write a CSRF token into your page markup, so it works for pure JSON API applications.

Note that there is nothing AngularJS specific here, and this will work with any other front-end that implements the same scheme.

*Version 3 supports only Rails 4+ and Ruby 2.3+. If you are still on Rails 3 (2, 1?!), you have to utilize version 2.1.1!*

## Installation

Add this line to your application's *Gemfile*:

    gem 'angular_rails_csrf'

And then execute:

    $ bundle

That's it!

## Configuration
### Cookie Domain

Starting from version 3, you may set domain for the XSRF cookie:

```ruby
# application.rb
class Application < Rails::Application
  #...
  config.angular_rails_csrf_domain = :all
end
```

If `angular_rails_csrf_domain` is not set, it defaults to `nil`.

### Exclusions

Sometimes you will want to skip setting the XSRF token for certain controllers (for example, when using SSE or ActionCable, as discussed [here](https://github.com/jsanders/angular_rails_csrf/issues/7)):

```ruby
class ExclusionsController < ApplicationController
  exclude_xsrf_token_cookie
  
  # your actions here...
end
```

## Testing

Run

```console
$ bundle install
```

and then

```console
$ rake test
```

## License 

Licensed under the [MIT License](https://github.com/jsanders/angular_rails_csrf/blob/master/LICENSE).

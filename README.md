## AngularJS-style CSRF Protection for Rails

![Gem](https://img.shields.io/gem/v/angular_rails_csrf)
![CI](https://github.com/jsanders/angular_rails_csrf/actions/workflows/ci.yml/badge.svg)
![Downloads total](https://img.shields.io/gem/dt/angular_rails_csrf)

The AngularJS [ng.$http](http://docs.angularjs.org/api/ng.$http) service has built-in CSRF protection. By default, it looks for a cookie named `XSRF-TOKEN` and, if found, writes its value into an `X-XSRF-TOKEN` header, which the server compares with the CSRF token saved in the user's session.

This project adds direct support for this scheme to your Rails application without requiring any changes to your AngularJS application. It also doesn't require the use of `csrf_meta_tags` to write a CSRF token into your page markup, so it works for pure JSON API applications.

Note that there is nothing AngularJS specific here, and this will work with any other front-end that implements the same scheme.

Check [version compatibility](https://github.com/jsanders/angular_rails_csrf/wiki/Version-Compatibility) to learn which Rails/Rubies are currently supported.

## Installation

Add this line to your application's *Gemfile*:

```ruby
gem 'angular_rails_csrf'
```

And then execute:

```console
$ bundle
```

That's it!

## Configuration

### Cookie Name

The default cookie's name is `XSRF-TOKEN` but it can be configured with the `angular_rails_csrf_cookie_name` setting:

```ruby
# application.rb
class Application < Rails::Application
  #...
  config.angular_rails_csrf_cookie_name = 'CUSTOM_NAME'
end
```

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

### Secure Cookie

To set a "secure" flag for the cookie, set the `angular_rails_csrf_secure` option to `true`:

```ruby
# application.rb
class Application < Rails::Application
  #...
  config.angular_rails_csrf_secure = true
end
```

`angular_rails_csrf_secure` defaults to `false`.

### SameSite

The SameSite attribute defaults to `:lax`. You can override this in the config:

```ruby
# application.rb
class Application < Rails::Application
  #...
  config.angular_rails_csrf_same_site = :strict
end
```

**NOTE**: When using `config.angular_rails_csrf_same_site = :none`, this gem automatically sets the cookie to `Secure` (`config.angular_rails_csrf_secure = true`) to comply with [the specifications](https://tools.ietf.org/html/draft-west-cookie-incrementalism-00).

Please note that [Safari is known to have issues](https://bugs.webkit.org/show_bug.cgi?id=198181) with SameSite attribute set to `:none`.

### HttpOnly Cookie

To set the ["httponly" flag](https://owasp.org/www-community/HttpOnly) for your cookie, set the `angular_rails_csrf_httponly` option to `true`:

```ruby
# application.rb
class Application < Rails::Application
  #...
  config.angular_rails_csrf_httponly = true
end
```

`angular_rails_csrf_httponly` defaults to `false`.

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

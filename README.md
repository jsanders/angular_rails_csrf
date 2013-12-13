# AngularJS-style Cookie/Header CSRF Protection for Rails

The CSRF protection scheme used by [ng.$http](http://docs.angularjs.org/api/ng.$http) is to look for a cookie named `XSRF-TOKEN`, and if found, write its value into an `X-XSRF-TOKEN` header on all requests. This project adds direct support for this scheme to your Rails application without requiring any changes to your AngularJS application. It also doesn't require the use of `csrf_meta_tags` to write a CSRF token into your page markup, so it works for pure JSON API applications.

## Installation

Add this line to your application's Gemfile:

    gem 'angular_rails_csrf', github: 'jsanders/angular_rails_csrf', branch: 'master'

And then execute:

    $ bundle

That's it!

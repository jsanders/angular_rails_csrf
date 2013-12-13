# angular_rails_csrf

The scheme used by [ng.$http](http://docs.angularjs.org/api/ng.$http) is to look for a cookie named `XSRF-TOKEN`, and if found, write its value into an `X-XSRF-TOKEN` header on all requests. This project sets up Rails to work with this scheme.

## Installation

Add this line to your application's Gemfile:

    gem 'angular_rails_csrf', github: 'jsanders/angular_rails_csrf', branch: 'master'

And then execute:

    $ bundle

That's it!

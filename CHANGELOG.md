# Changelog

## 3.1.0

Updated:
* Added support for Rails 5.2.0

Testing:
* Tested against more recent Ruby/Rails versions

## 3.0.0

New feature:
* Allow cookie domain to be set via `Rails.application.config` (thanks, [@gingermusketeer](https://github.com/gingermusketeer))

Updated:
* Dropped support for Rails < 4
* Dropped official support for Ruby 2.2 though it should still work

Testing:
* Test against more recent versions of Ruby and Rails

## 2.1.1

Updated:
* Added support for Rails 5.1.1

Testing:
* Test against more recent versions of Ruby
* Test against Rails 5.1.1

## 2.1.0

Updated:
* Added support for Rails 5.1

Testing improvements:
* Tested against Rails 5.1
* Tested against Ruby 2.4.0
* We are no longer testing against Rails < 4.2

## 2.0.0

**Breaking changes:**
* Revert to `after_action` again (fixes [issues with Devise](https://github.com/jsanders/angular_rails_csrf/issues/17) and similar solutions)
* Introduced a new `exclude_xsrf_token_cookie` class method to exclude setting CSRF token for certain controllers. This is done to take care of [problems with streaming](https://github.com/jsanders/angular_rails_csrf/issues/7).

Updated:
* Added support for Rails 5
* `rails` dependency changed to `railties`

Testing improvements:
* Tested against Rails 5
* Tested against Ruby 2.2.5 and 2.3.0

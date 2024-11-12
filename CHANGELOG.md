# Changelog

## 7.0.0 (12-Nov-24)

* **Breaking change**: require Ruby 3.2+. If you need support for older Rubies, stay on version 6
* Set Railties dependency to `< 9`
* Test with Rails 8
* Do not test with Ruby 3.0 and 3.1

## 6.0.0 (14-Nov-23)

* **Breaking change**: drop support for Ruby < 3. If you need to support older Rubies, stay on v5. If you'd like to support *even older stuff*, v4.5.0 is your choice as it plays nicely with Rails 5.1 and Ruby 2.5.
* Test only with Rails 7
* Fix some failing tests, minor tweaks

## 5.0.0 (14-Dec-21)

* Add support for Rails 7.
* Test against Rails 6.1 and Rails 7.0.
* Test against Ruby 3.0.
* Rails 5.1 is not supported officially anymore (but should still work fine).
* Ruby < 2.7 is not supported anymore (has reached end of life) but should still work.

## 4.5.0 (21-Sep-20)

* Added a new [`HttpOnly` option](https://github.com/jsanders/angular_rails_csrf#httponly-cookie) (thanks, [@Lubo-mir](https://github.com/Lubo-mir))
* Introduced some code refactorings

## 4.4.0 (04-Aug-20)

* Make the gem play nicely with controllers that do not have `protect_against_forgery?` method defined — for example, certain Doorkeeper controllers (thanks, [@amenz](https://github.com/amenz))
* Updated dependencies and cops

## 4.3.0 (18-May-20)

* Ruby version 2.4 is no longer officially supported (though it still should work) - this is also due to the fact that [v2.4 is abanoded by Ruby core team as well](https://www.ruby-lang.org/en/news/2020/04/05/support-of-ruby-2-4-has-ended/). Required Ruby version is now 2.5+ according to [version compatibility](https://github.com/jsanders/angular_rails_csrf/wiki/Version-Compatibility).
* Dropped backwards compatibility with older versions of Rails (v4 and below). [If you require Rails 4 support, use angular_rails_csrf v3]((https://github.com/jsanders/angular_rails_csrf/wiki/Version-Compatibility)).
* Increased test coverage up to 100%.

## 4.2.0 (31-Mar-20)

* Added a new [`angular_rails_csrf_same_site` option](https://github.com/jsanders/angular_rails_csrf#samesite) which defaults to `:lax` (thanks, [@timobleeker](https://github.com/timobleeker))
  + This option is introduced to comply with the latest changes: https://www.chromium.org/updates/same-site
* Update cops

## 4.1.0 (03-Feb-20)

* Added a new [`angular_rails_csrf_secure` option](https://github.com/jsanders/angular_rails_csrf#secure-cookie) (thanks, [@DougKeller](https://github.com/DougKeller))
* Tested against Ruby 2.7

## 4.0.1 (23-Dec-19)

* Updated dependencies, tested against more recent Rubies and Rails
* Updated Gemfile for Bundler 2
* Added Rubocop and SimpleCov

## 4.0.0 (20-Aug-19)

Updated:
* Added support for Rails 6.0
* Drop support for Rails 4

## 3.2.0

New feature:
* Allow cookie's name to be customized (thanks, [@timobleeker](https://github.com/timobleeker))

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

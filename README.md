[![Gem Version](https://badge.fury.io/rb/knife-director.svg)](https://badge.fury.io/rb/knife-director)

# Knife::Director

This gem provides wrappers for `knife bootstrap` or `knife zero` and so on.

## Installation

Add this line to your Gemfile:

```ruby
gem 'knife-director'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install knife-director

## Usage

```
# Linux host
knife director bootstrap linux $target -E $env

# Windows host
knife director bootstrap windows $target -E $env
```

## Provided commands

### knife director bootstrap XXX

`XXX` can be `linux` or `windows`.

It wraps `knife bootstrap` or `knife bootstrap windows winrm`.
You can't omit `-E (--environment)` option.

You need not specify `-N (--node-name)` option since it sets FQDN as the node name,
but you can do it to explicitly specify.

It automatically passes `--bootstrap-template` option to them.
Prepare `.chef/bootstrap/{linux,windows}.erb` or pass `-t __no_template__` to disable template.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/elastic-infra/knife-director. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Knife::Director project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/knife-director/blob/master/CODE_OF_CONDUCT.md).

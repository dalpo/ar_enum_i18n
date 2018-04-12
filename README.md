# ActiveRecord Enum I18n

ActiveRecord Enum internationalizations utils gem

## Roadmap / TODO

- [ ] Better documentation
- [ ] Test coverage
- [ ] Gem release

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ar_enum_i18n', github: 'dalpo/ar_enum_i18n'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ar_enum_i18n

## Usage

```ruby
class User < ActiveRecord::Base
  include ArEnumI18n

  enum status: %i[active]
  enum_i18n :status
end
```

## Instance Methods

### human_#{enum_field}

> Return the translated enum value. Equivalent to:

```ruby
I18n.t [:activerecord, :enum, User.name.underscore, enum_field, enum_value].join('.'),
        default: enum_value.to_s.humanize
```

## Class Methods

### enum_i18n(*args)

> Define i18n methods for one enum fields.

```ruby
class User < ActiveRecord::Base
  include ArEnumI18n

  enum status: %i[active archived]
  enum alarm_level: %i[none warning dander]

  enum_i18n :status, :alarm_level
end
```

### #{key}_enum

> Return an array with the `['enum translated label', 'enum value']` for each enum value.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dalpo/ar_enum_i18n. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ar::Enum::I18n project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/dalpo/ar_enum_i18n/blob/master/CODE_OF_CONDUCT.md).

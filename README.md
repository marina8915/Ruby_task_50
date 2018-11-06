# tasks_gem

50 tasks
https://rubygems.org/gems/tasks_gem

Book with tasks http://libgen.io/book/index.php?md5=02CEF7BC8F9FAF75690C1CBE83BE3B70

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tasks_gem'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tasks_gem

## Usage

Example:
```ruby
require 'tasks'

print Tasks::Task.number_array(digit: 2356), "\n"
print Tasks::Task.task_1(number_a: 2, number_b: 5), "\n"
```

All methods:
```ruby
print Tasks::Task.methods(false), "\n"
```
## Dependencies:

run_tests ~> 0.1.1
https://rubygems.org/gems/run_tests

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tasks. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Tasks project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tasks/blob/master/CODE_OF_CONDUCT.md).

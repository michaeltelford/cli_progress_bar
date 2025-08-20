# CLIProgressBar

A progress bar for the command line, written in ruby.

## Usage

```ruby
require "cli_progress_bar"

progress_bar = CLIProgressBar.new("2.3 MiB")

progress_bar.update(25)
progress_bar.update(50)
progress_bar.update(75)
progress_bar.update(100)
```

Produces an output of:

```sh
[------------------->                                                            ]  25% of 2.3 MiB
[--------------------------------------->                                        ]  50% of 2.3 MiB
[----------------------------------------------------------->                    ]  75% of 2.3 MiB
[------------------------------------------------------------------------------->]  100% of 2.3 MiB
```

## Why This Progress Bar?

There are many out there but progress bar...

- Is fully customisable with sensible defaults out of the box
- Has zero dependencies
- Has good examples and documentation
- Is heavily unit tested

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add cli_progress_bar
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install cli_progress_bar
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/michaeltelford/cli_progress_bar.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

# frozen_string_literal: true

require_relative "lib/cli_progress_bar/version"

Gem::Specification.new do |spec|
  spec.name = "cli_progress_bar"
  spec.version = CLIProgressBar::VERSION
  spec.authors = ["Michael Telford"]
  spec.email = ["michael.telford@live.com"]

  spec.summary = "A simple CLI progress bar for Ruby applications"
  spec.description = "A simple and customizable command line progress bar for Ruby applications"
  spec.homepage = "https://github.com/michaeltelford/cli_progress_bar"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).select do |f|
      f.start_with?(*%w[lib/])
    end
  end
  spec.bindir = "bin"
  spec.executables = spec.files.grep(%r{\Abin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end

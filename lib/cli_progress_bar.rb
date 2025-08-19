# frozen_string_literal: true

require_relative "cli_progress_bar/version"
require_relative "cli_progress_bar/progress_bar"

module CLIProgressBar
  class Error < StandardError; end

  def self.new(*args, **kwargs)
    ProgressBar.new(*args, **kwargs)
  end
end

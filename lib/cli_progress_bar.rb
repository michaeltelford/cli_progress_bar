# frozen_string_literal: true

require_relative "cli_progress_bar/version"
require_relative "cli_progress_bar/progress_bar"
require_relative "cli_progress_bar/percent_progress_bar"
require_relative "cli_progress_bar/item_progress_bar"

module CLIProgressBar
  LOG_AT_ALL_PERCENTS = (1..100).to_a.freeze
  LOG_AT_FIVE_PERCENTS = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100].freeze
  LOG_AT_TEN_PERCENTS = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100].freeze
  LOG_AT_QUARTER_PERCENTS = [25, 50, 75, 100].freeze
  BAR_LENGTH = 60.freeze
  LINE_CHAR = "-".freeze
  STD_OUT = $stdout

  def self.new(*args, **kwargs)
    PercentProgressBar.new(*args, **kwargs)
  end
end

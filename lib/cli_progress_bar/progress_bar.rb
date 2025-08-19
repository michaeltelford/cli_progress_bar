
class CLIProgressBar::ProgressBar
  LOG_AT_ALL_PERCENTAGES = (0..100).step(1).to_a.freeze
  LOG_AT_TEN_PERCENTAGES = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100].freeze
  DEFAULT_BAR_LENGTH = 80.freeze

  attr_accessor :current_progress

  def initialize(of, log_at: LOG_AT_TEN_PERCENTAGES, bar_length: DEFAULT_BAR_LENGTH, stream: $stdout)
    @current_progress = 0
    @of = of
    @log_at = log_at
    @bar_length = bar_length
    @stream = stream
  end

  def increment(by: 1)
    @current_progress += by
    update(@current_progress)
  end

  def update(percent)
    return unless @log_at.include?(percent)

    write_to_stream(percent)
    nil
  end

  private

  # |------------------->       |  70% of 2.3 MiB
  def write_to_stream(percent)
    completed_length = (@bar_length * percent / 100).to_i
    remaining_length = @bar_length - completed_length
    line = "[#{'-' * (completed_length-1)}>#{' ' * remaining_length}]  #{percent}% of #{@of}"
    @stream.puts(line)
  end
end

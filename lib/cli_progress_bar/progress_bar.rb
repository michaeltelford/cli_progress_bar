
# Parent progress bar class to be inherited from only.
class CLIProgressBar::ProgressBar
  LOG_AT_ALL_PERCENTAGES = (1..100).to_a.freeze
  LOG_AT_TEN_PERCENTAGES = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100].freeze
  LOG_AT_QUARTER_PERCENTAGES = [25, 50, 75, 100].freeze
  BAR_LENGTH = 80.freeze

  attr_reader :progress

  def initialize(of, log_at: LOG_AT_TEN_PERCENTAGES, bar_length: BAR_LENGTH, stream: $stdout)
    @progress = 0
    @of = of
    @log_at = log_at
    @bar_length = bar_length
    @stream = stream
  end

  private

  # Percent: [------------------->       ]  70% of 2.3 MiB
  # Items:   [------------------>        ]  8 of 12 repos (66%)
  def write_to_stream(items: nil)
    return unless @log_at.include?(@progress)

    completed_length = (@bar_length * @progress / 100).to_i
    remaining_length = @bar_length - completed_length

    if items
      totals = "#{items} of #{@of} (#{@progress}%)"
    else
      totals = "#{@progress}% of #{@of}"
    end

    line = '[%s>%s]  %s' % [
      '-' * (completed_length-1), ' ' * remaining_length, totals
    ]

    @stream.puts(line)

    nil
  end
end


# Parent progress bar class to be inherited from only.
class CLIProgressBar::ProgressBar
  LOG_AT_ALL_PERCENTS = (1..100).to_a.freeze
  LOG_AT_FIVE_PERCENTS = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100].freeze
  LOG_AT_TEN_PERCENTS = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100].freeze
  LOG_AT_QUARTER_PERCENTS = [25, 50, 75, 100].freeze
  BAR_LENGTH = 80.freeze
  LINE_CHAR = "-".freeze
  STD_OUT = $stdout

  attr_reader :progress

  def initialize(
    of: "", log_at: LOG_AT_TEN_PERCENTS, bar_length: BAR_LENGTH,
    line_char: LINE_CHAR, prefix: "", suffix: "", stream: STD_OUT
  )
    raise "bar_length: must be positive and even" unless bar_length.positive? && bar_length.even?
    raise "stream: must respond to #puts" unless stream.respond_to?(:puts)

    @progress = 0
    @of = of.to_s
    @log_at = log_at
    @bar_length = bar_length
    @line_char = line_char
    @prefix = prefix
    @suffix = suffix
    @stream = stream
  end

  private

  # Writes a single line to stream, something like:
  #
  # Percent: [------------------->       ]  70% of 2.3 MiB
  # - or -
  # Items:   [------------------>        ]  8 of 12 repos (66%)
  def write_to_stream(prefix: nil, suffix: nil, items: nil)
    raise "Invalid progress value" unless @progress.between?(1, 100)

    return unless @log_at.include?(@progress)

    completed_length = (@bar_length * @progress / 100).to_i
    remaining_length = @bar_length - completed_length
    remaining_length -= 1 if remaining_length == @bar_length

    # Ensure non negative number and remove a char for the >
    completed_length = completed_length < 1 ? 0 : completed_length - 1

    prefix ||= @prefix
    prefix = prefix.empty? ? "" : "#{prefix.strip}  "
    suffix ||= @suffix
    suffix = suffix.empty? ? "" : " #{suffix.strip}"
    of_str = @of.empty? ? "" : " of #{@of.strip}"
    totals = if items
               "#{items}#{of_str} (#{@progress}%)"
             else
               "#{@progress}%#{of_str}"
             end

    line = "%s[%s>%s]  %s%s" % [
      prefix, @line_char * completed_length, " " * remaining_length, totals, suffix
    ]

    @stream.puts(line)
  end
end

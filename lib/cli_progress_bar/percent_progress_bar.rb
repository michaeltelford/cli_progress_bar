
# Progress bar for percentages, where you increment or set the current progress
# as a percentage and specify which percentages are to be logged to the stream.
module CLIProgressBar
  class PercentProgressBar < ProgressBar
    def initialize(
      of: "", log_at: LOG_AT_TEN_PERCENTS, bar_length: BAR_LENGTH,
      line_char: LINE_CHAR, prefix: "", suffix: "", stream: STD_OUT
    )
      super
    end

    def increment(by: 1, suffix: nil)
      @progress += by
      write_to_stream(suffix: suffix)
    end

    def update(percent, suffix: nil)
      @progress = percent
      write_to_stream(suffix: suffix)
    end
  end
end

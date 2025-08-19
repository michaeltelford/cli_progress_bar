
# Progress bar for items, where you increment or set the current progress
# as an item count against a total, from which the percentage is calculated.
# e.g. max_items: 10, progress: 5 == 50% output on the progress bar.
module CLIProgressBar
  class ItemProgressBar < ProgressBar
    attr_reader :max_items

    def initialize(of, max_items, log_at: LOG_AT_TEN_PERCENTAGES, bar_length: BAR_LENGTH, stream: $stdout)
      super(of, log_at:, bar_length:, stream:)

      @max_items = max_items
    end

    def increment(by: 1)
      percent = by * 100 / @max_items
      @progress += percent
      write_to_stream
    end

    def update(num_items)
      percent = num_items * 100 / @max_items
      @progress = percent
      write_to_stream
    end
  end
end

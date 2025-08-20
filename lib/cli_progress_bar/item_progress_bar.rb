
# Progress bar for items, where you increment or set the current progress
# as an item count against a total, from which the percentage is calculated.
# e.g. max_items: 10, num_items: 5 == 50% output on the progress bar.
module CLIProgressBar
  class ItemProgressBar < ProgressBar
    attr_reader :max_items

    def initialize(
      max_items,
      of: "", log_at: LOG_AT_ALL_PERCENTS, bar_length: BAR_LENGTH,
      line_char: LINE_CHAR, prefix: "", suffix: "", stream: STD_OUT
    )
      raise "Invalid max items" unless max_items.positive?

      super(of:, log_at:, bar_length:, line_char:, prefix:, suffix:, stream:)

      @max_items = max_items
      @current_items = 0
    end

    def increment(by: 1)
      @current_items += by
      update_progress
    end

    def update(num_items)
      @current_items = num_items
      update_progress
    end

    private

    def update_progress
      @progress = percentage(@current_items, @max_items)
      write_to_stream(items: @current_items)
    end

    def percentage(num_items, max_items)
      num_items * 100 / max_items
    end
  end
end

# frozen_string_literal: true

require "test_helper"

class TestCLIPercentProgressBar < Minitest::Test
  def setup
    @stream = StringIO.new
  end

  def test_example_1
    progress_bar = CLIProgressBar.new(stream: @stream, of: "2.3 MiB")

    progress_bar.update(20)
    progress_bar.update(40)
    progress_bar.update(60)
    progress_bar.update(80)
    progress_bar.update(100)

    expected = <<~OUTPUT
[--------------->                                                                ]  20% of 2.3 MiB
[------------------------------->                                                ]  40% of 2.3 MiB
[----------------------------------------------->                                ]  60% of 2.3 MiB
[--------------------------------------------------------------->                ]  80% of 2.3 MiB
[------------------------------------------------------------------------------->]  100% of 2.3 MiB
    OUTPUT

    assert_equal expected, @stream.string
  end
end

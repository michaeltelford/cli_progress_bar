# frozen_string_literal: true

require "test_helper"

class TestCLIItemProgressBar < Minitest::Test
  def setup
    @stream = StringIO.new
  end

  def test_example_3
    progress_bar = CLIProgressBar.new_item_bar(5, of: "documents", bar_length: 30, line_char: ">", stream: @stream)
    5.times { |i| progress_bar.increment(prefix: "document#{i + 1}.txt") }

    expected = <<~OUTPUT
document1.txt  [>>>>>>                        ]  1 of 5 documents (20%)
document2.txt  [>>>>>>>>>>>>                  ]  2 of 5 documents (40%)
document3.txt  [>>>>>>>>>>>>>>>>>>            ]  3 of 5 documents (60%)
document4.txt  [>>>>>>>>>>>>>>>>>>>>>>>>      ]  4 of 5 documents (80%)
document5.txt  [>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]  5 of 5 documents (100%)
    OUTPUT
    assert_equal expected, @stream.string
  end

  def test_example_4
    progress_bar = CLIProgressBar.new_item_bar(12, of: "documents", bar_length: 30, line_char: ">", stream: @stream)
    12.times { |i| progress_bar.increment(prefix: " -%15s" % ["document#{i + 1}.txt"]) }

    expected = <<~OUTPUT
-  document1.txt  [>>                            ]  1 of 12 documents (8%)
-  document2.txt  [>>>>                          ]  2 of 12 documents (16%)
-  document3.txt  [>>>>>>>                       ]  3 of 12 documents (25%)
-  document4.txt  [>>>>>>>>>                     ]  4 of 12 documents (33%)
-  document5.txt  [>>>>>>>>>>>>                  ]  5 of 12 documents (41%)
-  document6.txt  [>>>>>>>>>>>>>>>               ]  6 of 12 documents (50%)
-  document7.txt  [>>>>>>>>>>>>>>>>>             ]  7 of 12 documents (58%)
-  document8.txt  [>>>>>>>>>>>>>>>>>>>           ]  8 of 12 documents (66%)
-  document9.txt  [>>>>>>>>>>>>>>>>>>>>>>        ]  9 of 12 documents (75%)
- document10.txt  [>>>>>>>>>>>>>>>>>>>>>>>>      ]  10 of 12 documents (83%)
- document11.txt  [>>>>>>>>>>>>>>>>>>>>>>>>>>>   ]  11 of 12 documents (91%)
- document12.txt  [>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>]  12 of 12 documents (100%)
    OUTPUT
    assert_equal expected, @stream.string
  end

  def test_example_7
    progress_bar = CLIProgressBar.new_item_bar(10, of: "webpages", stream: @stream)

    progress_bar.increment(by: 3)
    progress_bar.increment
    progress_bar.increment
    progress_bar.increment
    progress_bar.increment(by: 2, suffix: "Almost there!")
    progress_bar.update(10, suffix: "Complete :-)")

    expected = <<~OUTPUT
[----------------->                                          ]  3 of 10 webpages (30%)
[----------------------->                                    ]  4 of 10 webpages (40%)
[----------------------------->                              ]  5 of 10 webpages (50%)
[----------------------------------->                        ]  6 of 10 webpages (60%)
[----------------------------------------------->            ]  8 of 10 webpages (80%) Almost there!
[----------------------------------------------------------->]  10 of 10 webpages (100%) Complete :-)
    OUTPUT
    assert_equal expected, @stream.string
  end
end

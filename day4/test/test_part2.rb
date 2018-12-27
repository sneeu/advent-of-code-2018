require 'date'
require 'minitest/autorun'

require_relative '../lib/part2'

class PartTwo < Minitest::Test
  def setup
    @log = Log.new

    event = Event.new(7,
                      Time.new(2018, 12, 27, 0, 10, 0),
                      Time.new(2018, 12, 27, 0, 11, 0))
    event2 = Event.new(7,
                       Time.new(2018, 12, 28, 0, 10, 0),
                       Time.new(2018, 12, 28, 0, 11, 0))
    @log.add_event(event)
    @log.add_event(event2)
  end

  def test_peak_minute_for_sleeper
    assert_equal [10, 2], @log.peak_minute_for_sleeper(7)
  end

  def test_peak_minute
    assert_equal 70, @log.peak_minute
  end
end

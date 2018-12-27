require 'date'
require 'minitest/autorun'

require_relative '../lib/part1'

class PartOne < Minitest::Test
  def test_duration
    assert_equal 25, Event.new(nil,
                               Time.new(1518, 11, 1, 0, 30),
                               Time.new(1518, 11, 1, 0, 55)).duration
  end

  def test_parse_line
    p = LogParser.new
    assert_nil p.parse_line('[1518-11-01 00:00] Guard #10 begins shift')
    assert_nil p.parse_line('[1518-11-01 00:05] falls asleep')
    assert_equal Event.new(10,
                           Time.new(1518, 11, 1, 0, 5),
                           Time.new(1518, 11, 1, 0, 25)),
                 p.parse_line('[1518-11-01 00:25] wakes up')
    assert_nil p.parse_line('[1518-11-01 00:30] falls asleep')
    assert_equal Event.new(10,
                           Time.new(1518, 11, 1, 0, 30),
                           Time.new(1518, 11, 1, 0, 55)),
                 p.parse_line('[1518-11-01 00:55] wakes up')
  end

  def test_the_log
    l = Log.new

    l.add_event(Event.new(10, Time.new(1518, 11, 1, 0, 10), Time.new(1518, 11, 1, 0, 31)))
    l.add_event(Event.new(10, Time.new(1518, 11, 2, 0, 30), Time.new(1518, 11, 2, 0, 45)))

    assert_equal 10, l.peak_sleeper
    assert_equal [30, 2], l.peak_minute_for_sleeper(10)
    assert_equal 300, l.peak_sleep
  end
end

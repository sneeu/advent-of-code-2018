require 'minitest/autorun'

require_relative '../lib/part1'

class PartOne < Minitest::Test
  def test_sum_lines
    assert_equal 370, sum_lines(['+1', '+2', '+333', '-46', '-9', '+89'])
  end
end

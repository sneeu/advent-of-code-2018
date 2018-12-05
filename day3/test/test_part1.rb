require 'minitest/autorun'

require_relative '../lib/part1'

class PartOne < Minitest::Test
  def test_parse_line
    assert_equal [1, 2, 3, 5, 7], parse_line('#1 @ 2,3: 5x7')
    assert_equal [1, 11, 13, 17, 19], parse_line('#1 @ 11,13: 17x19')
    assert_equal [1, 111, 113, 117, 119], parse_line('#1 @ 111,113: 117x119')
  end

  def test_grid
    g = Grid.new(4, 4)
    g.add_cut(:x, 1, 1, 2, 2)
    g.add_cut(:y, 1, 1, 3, 3)
    assert_equal 4, g.overlaps
  end

  def test_overlaps
    assert_equal 0, overlaps(['#1 @ 1,1: 2x2'], 4, 4)
    assert_equal 4, overlaps(['#2 @ 1,1: 2x2', '#1 @ 1,1: 3x3'], 4, 4)
  end
end

require 'minitest/autorun'

require_relative '../lib/part1'

class PartOne < Minitest::Test
  def test_counter
    assert_equal({ 'a' => 3, 'b' => 2 }, counter('ababa'))
    assert_equal({ 'a' => 1, 'b' => 4 }, counter('bbabb'))
    assert_equal({ 'b' => 3 }, counter('bbb'))
  end

  def test_frequency
    assert_equal [5], frequency('abbbbb')
    assert_equal [2, 5], frequency('aabbbbb')
    assert_equal [5], frequency('aaaaabbbbb')
    assert_equal [5, 2], frequency('aaaaabb')
    assert_equal [5, 2, 3], frequency('aaaaabbccc')
  end

  def test_checksum
    assert_equal 12, checksum(['abcdef', 'bababc', 'abbcde', 'abcccd', 'aabcdd', 'abcdee', 'ababab'])
    assert_equal 15, checksum(['abbbbb', 'aabbbbb', 'aaaaabbbbb', 'aaaaabb', 'aaaaabbccc'])
  end
end





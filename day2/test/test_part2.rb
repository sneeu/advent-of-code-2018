require 'minitest/autorun'

require_relative '../lib/part2'

class PartOne < Minitest::Test
  def test_scalpel
    assert_equal 'abcefg', scalpel('abcDefg', 3)
  end

  def test_grouper
    assert_equal({ 'ac' => ['abc'], 'df' => ['def'] }, grouper(['abc', 'def'], 1))
    assert_equal({ 'ac' => ['abc', 'aXc'], 'df' => ['def'] }, grouper(['abc', 'def', 'aXc'], 1))
  end

  def test_distances
    assert_equal(['ac'], distances(['abc', 'def', 'aXc']))
    assert_equal(['ac', 'de'], distances(['abc', 'def', 'deZ', 'aXc']))
    assert_equal(['fgij'], distances(['abcde', 'fghij', 'klmno', 'pqrst', 'fguij', 'axcye', 'wvxyz']))
  end
end

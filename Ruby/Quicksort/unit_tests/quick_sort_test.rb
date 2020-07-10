require_relative '../quick_sort'
require 'minitest/autorun'

class QuickSortTest < Minitest::Test
  def test_quick_sort
    sorted_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
    Quicksort::quick_sort(arr)
    assert_equal(arr, sorted_arr)
  end

  def test_hoare_parition_quick_sort
    sorted_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    arr = [5, 3, 8, 7, 9, 6, 2, 4, 1]
  	Quicksort::tail_recursive_quick_sort(arr, 0, 8, 'hoare_partition')
  	assert_equal(arr, sorted_arr)
  end

  def test_partition
    arr = [1, 3, 8, 7, 9, 6, 2, 4, 5]
    partition_index = Quicksort::partition(arr, 0, 8)
    assert_equal(partition_index, 4)
  end
end

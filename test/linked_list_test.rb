require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require './lib/node'

class LinkedListTest < Minitest::Test
  def test_linked_list_exists
    list = LinkedList.new

    assert_instance_of LinkedList, list
  end

  def test_linked_list_head_starts_as_nil
    list = LinkedList.new

    assert_nil list.head
  end

  def test_append_to_list_method_creates_node_on_list
    list = LinkedList.new

    list.append('West')

    assert_instance_of Node, list.head
  end

  def test_list_head_next_node_is_nil
    list = LinkedList.new

    list.append('West')

    assert_nil list.head.next_node
  end

  def test_list_count_is_1_after_adding_node
    list = LinkedList.new

    list.append('West')

    assert_equal 1, list.count
  end

  def test_to_string_method
    list = LinkedList.new

    list.append('West')

    assert_equal 'The West family', list.to_string
  end
end

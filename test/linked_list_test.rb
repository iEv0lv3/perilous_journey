require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require './lib/node'
require 'pry'

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

  def test_node_can_be_appended_to_next_node
    list = LinkedList.new

    list.append('Rhoades')
    list.append('Hardy')

    assert_equal 'Hardy', list.head.next_node.surname
  end

  def test_multiple_nodes_can_be_counted
    list = LinkedList.new

    list.append('Rhoades')
    list.append('Hardy')
    assert_equal 2, list.count
  end

  def test_to_string_will_output_full_list_of_family_names
    list = LinkedList.new

    list.append('Rhoades')
    list.append('Hardy')
    assert_equal 'The Rhoades family, followed by the Hardy family', list.to_string
  end

  def test_prepend_adds_node_to_head_of_list
    list = LinkedList.new

    list.append('Brooks')
    list.append('Henderson')
    list.prepend('McKinney')

    assert_equal 3, list.count
    assert_equal 'McKinney', list.head.surname
  end

  def test_insert_adds_node_to_argument_index_and_adds_nodes_to_next_node
    list = LinkedList.new

    list.append('Brooks')
    list.append('Henderson')
    list.prepend('McKinney')
    list.insert(1, 'Lawson')

    assert_equal 'Lawson', list.head.next_node.surname
  end

  def test_find_returns_index_plus_length_of_families
    list = LinkedList.new

    list.append('Brooks')
    list.append('Henderson')
    list.prepend('McKinney')
    list.insert(1, 'Lawson')

    assert_equal 'The Lawson family', list.find(1, 1)
  end
end

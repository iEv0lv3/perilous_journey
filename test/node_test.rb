require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test
  def test_node_exists
    node = Node.new('Burke')

    assert_instance_of Node, node
  end

  def test_node_can_have_surname
    node = Node.new('Burke')

    assert_equal 'Burke', node.surname
  end

  def test_node_next_node_starts_as_nil
    node = Node.new('Burke')

    assert_nil node.next_node
  end
end

require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'
require 'pry'

class NodeTest < Minitest::Test
  def test_node_exists
    node1 = Node.new('Burke', 'pounds of food' => 200)

    assert_instance_of Node, node1
  end

  def test_node_can_have_surname
    node1 = Node.new('Burke', 'pounds of food' => 200)

    assert_equal 'Burke', node1.surname
  end

  def test_node_can_have_supplies
    node1 = Node.new('Burke', 'pounds of food' => 200)

    assert_equal true, node1.supplies == {'pounds of food' => 200}
  end

  def test_node_next_node_starts_as_nil
    node1 = Node.new('Burke', 'pounds of food' => 200)

    assert_nil node1.next_node
  end
end

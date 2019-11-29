require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require './lib/node'
require './lib/wagon_train'
require 'pry'

class WagonTrainTest < Minitest::Test
  def test_wagon_train_exists
    wt = WagonTrain.new

    assert_instance_of WagonTrain, wt
  end

  def test_wagon_train_can_have_wagon_nodes_appended_to_list
    wt = WagonTrain.new
    wt.append('Burke', 'pounds of food' => 200)

    assert_equal 'Burke', wt.list.head.surname
  end

  def test_wagon_train_can_have_multiple_wagon_nodes_appended_to_list
    wt = WagonTrain.new
    wt.append('Burke', 'pounds of food' => 200)
    wt.append('West', 'spare wagon tongues' => 3)

    assert_equal 'Burke', wt.list.head.surname
    assert_equal 'West', wt.list.head.next_node.surname
  end

  def test_can_count_number_of_wagons_in_list
    wt = WagonTrain.new
    wt.append('Burke', 'pounds of food' => 200)
    wt.append('West', 'spare wagon tongues' => 3)

    assert_equal 2, wt.count
  end

  def test_prepend_to_wagon_train
    wt = WagonTrain.new
    wt.append('Burke', 'pounds of food' => 200)
    wt.prepend('West', 'spare wagon tongues' => 3)

    assert_equal 'West', wt.list.head.surname
  end
end

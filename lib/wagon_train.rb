require './lib/node'
require './lib/linked_list'
require 'pry'

class WagonTrain
  attr_accessor :list

  def initialize
    @list = LinkedList.new
  end

  def prepend(family, supplies)
    @list.prepend(family, supplies)
  end

  def append(family, supplies)
    @list.append(family, supplies)
  end

  def insert(index, family, supplies)
    @list.insert(index, family, supplies)
  end

  def find(index, range)
    @list.find(index, range)
  end

  def includes?(name)
    @list.includes?(name)
  end

  def pop
    @list.pop
  end

  def to_string
    @list.to_string
  end

  def count
    @list.count
  end
end

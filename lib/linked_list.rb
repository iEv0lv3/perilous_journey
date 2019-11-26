require './lib/node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(data)
    @head = Node.new(data)
  end

  def count
    counter = []
    counter << @head
    counter.length
  end

  def to_string
    "The #{head.surname} family"
  end
end

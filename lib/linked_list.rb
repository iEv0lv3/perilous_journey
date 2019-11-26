require './lib/node'
require 'pry'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(data)
    if @head == nil
      @head = Node.new(data)
    else
      @head.next_node = Node.new(data)
    end
  end

  def prepend(data)
    pre = Node.new(data)
    pre.next_node = @head
    @head = pre
  end

  def count
    node_count = []
    current_node = @head

    while current_node.next_node != nil
      node_count << current_node
      current_node = current_node.next_node
    end

    node_count << @head
    node_count.length
  end

  def to_string
    node_surnames = []
    current_node = @head
    the_list = ""

    while current_node.surname != nil
      node_surnames << current_node.surname
      if current_node.next_node != nil
        current_node = current_node.next_node
      else
        break
      end
    end

    node_surnames.each do |surname|
      if surname == node_surnames[0]
        the_list.concat("The #{surname} family")
      else
        the_list.concat(", followed by the #{surname} family")
      end
    end
    the_list
  end
end

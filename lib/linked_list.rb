require './lib/node'
require 'pry'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(data)
    current_node = @head

    if @head == nil
      @head = Node.new(data)
    else
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(data)
    end
  end

  def prepend(data)
    pre = Node.new(data)
    pre.next_node = @head
    @head = pre
  end

  def insert(index, data)
    node = Node.new(data)
    node_count = []
    current_node = @head

    while current_node.next_node != nil
      node_count << current_node
      current_node = current_node.next_node
    end
    node_count << @head
    node.next_node = node_count[index]
    node_count[(index - 1)].next_node = node
  end

  def find(index, length)
    node_count = []
    current_node = @head
    families = ""

    while current_node.next_node != nil
      node_count << current_node
      current_node = current_node.next_node
    end
    node_count << @head
    
    count = 1
    length.times do
      if families.empty?
        families.concat("The #{node_count[index].surname} family")
        binding.pry
      else
        families.concat(", followed by the #{node_count[index + count].surname} family")
        count += 1
        binding.pry
      end
    end
    families
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

list = LinkedList.new

list.append('Brooks')
list.append('Henderson')
list.prepend('McKinney')
list.insert(1, 'Lawson')

binding.pry
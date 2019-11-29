require './lib/node'

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(family, supplies)
    current_node = @head

    if @head == nil
      @head = Node.new(family, supplies)
    else
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(family, supplies)
    end
  end

  def prepend(family, supplies)
    pre = Node.new(family, supplies)
    pre.next_node = @head
    @head = pre
  end

  def insert(index, family, supplies)
    node = Node.new(family, supplies)
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

  def find(index, range)
    node_count = []
    current_node = @head
    families = ""

    while current_node.next_node != nil
      node_count << current_node
      current_node = current_node.next_node
    end
    node_count << @head

    count = 0
    range.times do
      if families.empty?
        families.concat("The #{node_count[index].surname} family")
        count += 1
      elsif node_count[index + count] == node_count.last
        families.concat(", followed by the #{current_node.surname} family")
        break
      elsif (index + count) <= range
        families.concat(", followed by the #{node_count[index + count].surname}
          family")
        count += 1
      elsif (index + count) >= range && node_count[index + count].last
        families.concat(", followed by the #{current_node.surname} family")
      end
    end
    families
  end

  def includes?(name)
    current_node = @head
    loop do
      return true if current_node.surname == name

      if current_node.surname != name && !current_node.next_node.nil?
        current_node = current_node.next_node
      elsif current_node.next_node.nil?
        return false
      end
    end
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

  def pop
    current_node = @head
    until current_node.next_node.next_node.nil?
      current_node = current_node.next_node
    end
    popped_node = current_node.next_node
    current_node.next_node = nil
    puts "The #{popped_node.surname} family has died of dysentery"
    popped_node
  end
end

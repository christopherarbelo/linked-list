# frozen_string_literal: true

# class for Linked List
class LinkedList
  attr_accessor :node, :head
  def initialize
    self.head = nil
  end

  def append(value)
    self.head = Node.new(value) and return unless head

    node = head
    node = node.next while node.next
    node.next = Node.new(value)
  end

  def prepend(value)
    node = Node.new(value)
    node.next = head
    self.head = node
  end

  def tail
    node = head
    node.nil? || (node = node.next while node.next)
    node
  end

  def at(index)
    node = head
    return nil if index > size - 1

    node = node.next and index -= 1 until index.zero?
    node
  end

  def pop
    return unless head

    current_node = head
    previous_node = current_node and current_node = current_node.next while current_node.next
    if previous_node then previous_node.next = nil
    else self.head = nil end
    current_node
  end

  def contains?(value)
    node = head
    while node
      return true if node.data == value

      node = node.next
    end
    false
  end

  def find(value)
    node = head
    index = 0
    while node
      return index if node.data == value

      index += 1
      node = node.next
    end
  end

  def insert_at(index, value)
    return prepend(value) if index.zero?

    previous = head
    current = head
    node = Node.new(value)
    index.times do
      return 'Index exceeds Linked List' unless current

      previous = current and current = current.next
    end
    node.next = current
    previous.next = node
  end

  def size
    size = 0
    node = head
    size += 1 and node = node.next while node
    size
  end

  def remove_at(index)
    previous = head
    current = head
    index.times do
      return 'Index exceeds Linked List' unless current

      previous = current
      current = current.next
    end
    return 'Can\'t remove nil' unless current

    index.zero? ? self.head = current.next : previous.next = current.next
    current
  end

  def to_s
    list = []
    node = head
    list << node and node = node.next while node
    list.length.positive? ? "head => #{list.join(' => ')} => nil" : 'head => nil'
  end
end

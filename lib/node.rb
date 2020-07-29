# frozen_string_literal: true

# class for Node
class Node
  attr_accessor :data, :next
  def initialize(data)
    self.data = data
    self.next = nil
  end

  def to_s
    "(#{data || 'nil'})"
  end
end

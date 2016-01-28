class Node

  attr_accessor :value, :child, :parent

  def initialize(value = nil, parent = nil, child = nil)
    @value = value
    @parent = parent
    @child = child
  end
end


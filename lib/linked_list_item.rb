class LinkedListItem
  include Comparable

  attr_reader :next_item
  attr_reader :payload

  def initialize(payload)
    @payload = payload
  end

  def ===(other)
    self.equal?(other)
  end

  def <=>(other)
    
    if self.payload.class == other.payload.class
      self.payload <=> other.payload
    else
      precedence =[Fixnum, String, Symbol]
      left = precedence.index(self.payload.class)
      right = precedence.index(other.payload.class)
      left <=> right
    end
  end

  def next_item=(other_item)
    raise ArgumentError if other_item === self
    @next_item = other_item
  end

  def last?
    !@next_item
  end

end

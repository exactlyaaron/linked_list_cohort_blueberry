class LinkedList

  attr_accessor :size

  def initialize(*value)
    @size = 0

    if value.size > 0
      value.each do |val|
        push(val) unless val.nil?
      end
    end

    # push(value) unless value.nil?
    #
    # if args.length > 0
    #   args.each do |i|
    #     push(args[i].to_s)
    #   end
    # end
  end

  def push(value)
    @size += 1
    lli = LinkedListItem.new(value)
    if @first_item
      last_item.next_item = lli
    else
      @first_item = lli
    end
  end

  def get(index)
    raise IndexError if index < 0

    current_item = @first_item
    index.times do
      raise IndexError if current_item.nil?
      current_item = current_item.next_item
    end
    current_item.payload
  end

  def size
    @size
  end

  def last
    if @size == 0
      nil
    else
      self.get(@size - 1)
    end
  end

  def to_s
    if @size == 0
     "| |"
    else
      array = []
      @size.times do |i|
        array.push(self.get(i))
      end
      "| "+array.join(', ')+" |"
    end
  end

  def [](index)
    get(index)
  end

  def get_item(index)
    raise IndexError if index < 0

    current_item = @first_item
    index.times do
      raise IndexError if current_item.nil?
      current_item = current_item.next_item
    end
    current_item
  end

  def []=(index, value)
    item = get_item(index)
    item.payload = value
  end

  def delete(index)
    @size -= 1
    if index == 0
      @first_item = get_item(1)
    else
      deleted = get_item(index)
      prev = get_item(index - 1)
      new_next = get_item(index + 1)
      prev.next_item = new_next
    end
  end

  def index(value)
    if @size == 0
      return nil
    end

    @size.times do |i|
      if get_item(i).payload == value
        return i
      elsif i == @size - 1
        return nil
      end
    end
  end

  private

  def last_item
    current_item = @first_item
    until current_item.last?
      current_item = current_item.next_item
    end
    current_item
  end

end

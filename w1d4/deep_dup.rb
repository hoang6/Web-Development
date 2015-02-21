class Array
  def deep_dup
    # new_array = []
    # self.each do |el|
       map { |el| el.is_a?(Array) ? el.deep_dup : el}
    # end
  end
end

class Array
  def deep_dup
    # Argh! Mario and Kriti beat me with a one line version?? Must
    # have used `inject`...
    [].tap do |new_array|
      self.each do |el|
        new_array << (el.is_a?(Array) ? el.deep_dup : el)
      end
    end
  end
  # The renowned one-line inject version of deep_dup
  # Beware inject!
  def dd_inject
    inject([]) { |dup, el| dup << (el.is_a?(Array) ? el.dd_inject : el) }
  end
  # Beware map! The ultimate one-liner.
  def dd_map
    map { |el| el.is_a?(Array) ? el.dd_map : el }
  end
end


x = [1, 2, 3]
y = x.dd_inject

y << 5

p x, y

# p [1,2,3].deep_dup
# p [1, [2], [3, [4]]]

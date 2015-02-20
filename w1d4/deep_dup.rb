class Array
  def self.deep_dup(arr)
    arr.each do |el|
      if self.is_a? Array
        self << el
      end
    end
    self
  end
end

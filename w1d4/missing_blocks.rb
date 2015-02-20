class Array
  def my_each(&proc)
    self.count.times { |el| prc.call(self[el]) }
    self
  end

  def my_map(&prc)
    index = 0
    may_map_array = []

    while index < self.count
      may_map_array[index] = prc.call(self[index])
      index += 1
    end

    may_map_array
  end

  def my_select(&prc)
    my_select_array = []
    self.my_each do |el|
      my_select_array << el if prc.call(el)
    end

    my_select_array
  end

  def my_inject(&prc)
    result = self[0]
    self.my_each { |el| result = prc.call(result, el) }

    result
  end

  def my_sort!(&prc)
    for index1 in 0..(self.length - 2)
      for index2 in (index1 + 1)..(self.length - 1)
        if prc.call(self[index1], self[index2]) == 1
          self[index1],self[index2] = self[index2],self[index1]
        end
      end
    end
    self
  end

end

# p [16, 2, 4].inject { |sum, num| sum / num }
# p [1,4,2,7,6].my_sort! { |num1, num2| num1 <=> num2 }
# p [1,4,2,7,6].my_sort! { |num1, num2| num2 <=> num1 }


def eval_block(*args, &prc)
  return "NO BLOCK GIVEN!" if !block_given?

  prc.call(args)
end
p eval_block(1,2,3,4,5) { |*args| args.inject(:+) }

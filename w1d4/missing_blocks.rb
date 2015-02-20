class Array
  def my_each(&prc)
    self.count.times { |el| prc.call(self[el]) }
    self
  end

  def my_map(&prc)
    index = 0
    mapped_array = []

    self.my_each do |el|
      mapped_array << prc.call(el)
    end

    mapped_array
  end

  def my_select(&prc)
    select_array = []

    self.my_each do |el|
      select_array << el if prc.call(el)
    end

    select_array
  end

  def my_inject(&prc)
    result = 0

    self.each { |el| result = prc.call(result, el) }

    result
  end


  def my_sort!(&prc)
    for i in (0..self.length-2)
      for j in (i + 1..self.length-1)
        if  prc.call(self[i], self[j]) == 1
          self[i],self[j] = self[j],self[i]
        end
      end
    end

    self
  end

  def my_sort(&prc)
    p self.dup.my_sort!(&prc)
    self
  end

end

def eval_block(*args, &prc)
  if prc.nil?
    print "NO BLOCK GIVEN"
  else
    prc.call(*args)
  end
end

# eval_block("Kerry", "Washington", 23) do |fname, lname, score|
#   puts "#{lname}, #{fname} won #{score} votes."
# end
p [1,2,3,5].my_map { |num| num*2 }
# p [1,8,5,7,5].my_sort {|num1, num2| num2 <=> num1}

# p [1,2,3,5].my_each { |num| puts num }

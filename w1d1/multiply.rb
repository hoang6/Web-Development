def multiply_array(array)
  array.map do |num|
    num * 2
  end
end

class Array
  def my_each(&prc)
    idx = 0
    while idx < self.length
      prc.call(self[idx])
      idx += 1
    end

    self
  end
end

array = [1,2,3]

array.my_each do |i|
  puts i * 2
end

def median(array)
  length = array.length

  if length.even?
    (array[length/2 - 1] + array[length/2])/2
  else
    array[ length/2]
  end
end

def concatenate(array)
  array.inject(:+)
end

p multiply_array([1,2,4])

p median([0,1,2,3,5])
p median([0,1,2,4,4,5])

p concatenate(["Hello world", "App Academy", "Test"])

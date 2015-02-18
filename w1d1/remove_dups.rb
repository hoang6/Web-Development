# def my_uniq(array)
# output = []
# for i in 0..array.length - 1
#   unless output.include?(array[i])
#     output << array[i]
#   end
# end
# output
# end

# p my_uniq([1,2,1,3,3])

class Array
  def my_uniq
    uniqs = []
    (0...self.length).each do |i|
      unless uniqs.include?(self[i])
        uniqs << self[i]
      end
    end

    uniqs
  end
end

x = [1, 2, 1, 3, 3]
p x.my_uniq

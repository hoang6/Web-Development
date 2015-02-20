# class Array
#   def self.deep_dup(arr)
#     arr.each do |el|
#       if self.is_a? Array
#         self << el
#       end
#     end
#     self
#   end
# end

def fib_recursive(n)
  if n == 0
    []
  elsif n == 1
    [1]
  elsif n == 2
    [1,1]
  else
    fib_recursive(n - 1) << fib_recursive(n - 1)[-1] + fib_recursive(n - 1)[-2]
  end
end


def fib_iterative(n)
    if n == 0
      fibs = []
    elsif n == 1
      fibs = [1]
    elsif n == 2
      fibs = [1,1]
    else
      fibs = [1,1]
      until fibs.count == n
      fibs << fibs[-2] + fibs[-1]
      end
    end
  fibs
end

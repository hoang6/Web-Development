def fib_recursive(n)
  # if n == 0
  #   []
  # elsif n == 1
  #   [1]
  # elsif n == 2
  #   [1, 1]
  # A more elegent way (the Ruby's way) to achive the same thing
  if n <= 2
    [0, 1].take(n)
  else
    fibs = fib_recursive(n - 1)
    fibs << fibs[-2] + fibs[-1]
  end
end

def fib_iterative(n)
  if n <= 2
    [0, 1].take(n)
  else
    fibs = [0, 1]
    until fibs.count == n
      fibs << fibs[-2] + fibs[-1]
    end
  end
  fibs
end

# p fib_recursive(15)
# p fib_iterative(15)

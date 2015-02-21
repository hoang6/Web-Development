def fib_recursive(n)
  # if n == 0
  #   []
  # elsif n == 1
  #   [1]
  # elsif n == 2
  #   [1, 1]
  if n <= 2
    [0, 1].take(n)
  else
    fibs = fib_recursive(n - 1)
    fibs << fibs[-2] + fibs[-1]
  end
end

p fib_recursive(15)

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

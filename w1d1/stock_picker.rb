def stock_picker(array)
  max_profit = 0
  days = []

  for i in 0..(array.length - 2)
    for j in (i + 1)..(array.length - 1)
      if array[j] - array[i] > max_profit
        days = [i, j]
        max_profit = array[j] - array[i]
      end
    end
  end

  days
end

p stock_picker([0, 100, 4, 200])

def subsets(array)
  if array.count == 0
    return [[]]
  else
    last_num = array.pop
    subs = subsets(array)
    subs + subs.map { |el| el + [last_num] }
  end
end

p subsets([1, 2, 3])

def range(start_num, end_num)

  if start_num == end_num
    return [end_num]
  else
    [start_num] + range(start_num + 1, end_num)
  end

end

def iterative_sum(nums)
  nums.inject(:+)
end

def recursive_sum(nums)
  if nums.count == 1
    return nums[0]
  else
    nums.shift + recursive_sum(nums)
  end
end

p recursive_sum([1, 2, 3, 4, 5])

def exponent1(base, num)
  if num == 0
    1
  else
    base * exponent1(base, num - 1)
  end
end

def exponent2(base, num)
  if num == 0
    1
  elsif num == 1
    base
  elsif num % 2 == 0
    exponent2(base, num / 2) * exponent2(base, num / 2)
  else
    base * (exponent2(base, (num - 1) / 2)) * (exponent2(base, (num - 1) / 2))
  end
end

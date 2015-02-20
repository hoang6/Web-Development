def range(start_num, end_num)
  ary = []

  return ary if start_num > end_num
  # while start_num < end_num - 1
    # start_num += 1
  ary << (start_num)
  ary += range(start_num + 1, end_num)
  # end
  ary

end

p range(1, 10)

def iterative_sum(nums)
  nums.inject(:+)
end

def recursive_sum(nums)
  if nums.count < 2
    return nums[0]
  else
    nums.shift + recursive_sum(nums)
  end
end

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

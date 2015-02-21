def bsearch(nums, target)
  return nil if nums.count == 0

  pivot = nums.length / 2

  if target == nums[pivot]
    pivot
  elsif target < nums[pivot]
    bsearch(nums.take(pivot), target)
  else
    sub_answer = bsearch(nums.drop(pivot + 1), target)
    (sub_answer.nil?) ? nil : (pivot + 1) + sub_answer
  end
end

bsearch([2, 3, 4, 5], 1)
# p bsearch([1, 2, 3, 4, 5], 2)
# p bsearch([1, 2, 3, 4, 5], 4)
# p bsearch([1, 2, 3, 4, 5], 3)
# p bsearch([1, 2, 3, 4, 5], 5)

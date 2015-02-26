# def merge_sort(nums)
#   if nums.count <= 1
#     return nums
#   else
#     pivot = nums.count / 2
#     left = nums.take(pivot)
#     right = nums.drop(pivot)
#     merge(merge_sort(left), merge_sort(right))
#   end
# end
#
# def merge(left, right)
#   if left.first <= right.first
#     [left.shift] + [right.shift] + left + right
#   else
#     [right.shift] + [left.shift] + left + right
#   end
# end
#
# p merge_sort([1, 5, 4, 2, 7, 5])


def quick_sort(nums)
  if nums.count <= 1
    return nums
  else
    pivot = nums.sample
    left = nums.select { |num| num < pivot}
    right = nums.select { |num| num > pivot}

    quick_sort(left) + [pivot] + quick_sort(right)
  end
end

p quick_sort([1, 5, 4, 2, 7, 5])

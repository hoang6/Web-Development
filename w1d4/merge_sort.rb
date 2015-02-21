def merge_sort(nums)
  if nums.count == 0
    return []
  elsif nums.count == 1
    return [nums.first]
  else
    pivot = nums.count / 2
    nums1 = nums.take(pivot)
    nums2 = nums.drop(pivot)
    merge(merge_sort(nums1), merge_sort(nums2))
  end
end

def merge(nums1, nums2)
  if nums1.first <= nums2.first
    [nums1.shift] + [nums2.shift] + nums1 + nums2
  else
    [nums2.shift] + [nums1.shift] + nums1 + nums2
  end
end

p merge_sort([1, 5, 4, 2, 7, 5])

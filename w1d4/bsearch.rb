def bsearch(array, target)
  new_array = array.dup.sort

  pivot = new_array.length / 2

  if target == new_array[pivot]
    pivot
  elsif new_array.count == 1 && (target != new_array[pivot])
    nil
  else
    if target < new_array[pivot]
      bsearch(new_array[XXX...pivot], target)
    else
      bsearch(new_array[pivot...XXX], target)
    end

  end
end

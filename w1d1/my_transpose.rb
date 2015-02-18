def my_transpose(array)
  output = Array.new(array.length) {Array.new}
  for i in 0...array.length
    for j in 0...array.length
      output[i][j] = array[j][i]
    end
  end
  for i in 0..output.length
  end
  output
end

p my_transpose([
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8]
  ])

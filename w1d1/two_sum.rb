class Array
  def two_sum
    zero_pairs = []

    for i in 0..(self.length - 2)
      for j in (i + 1)..(self.length - 1)
        if self[i] + self[j] == 0
          zero_pairs << [i,j]
        end
      end
    end

    zero_pairs
  end
end

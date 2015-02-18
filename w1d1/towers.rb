# require 'byebug'
def towers_of_hanoi
  # debugger
  first = [4,3,2,1]
  second = []
  third = []

  towers = [[4,3,2,1], [], []]

  while (towers[2] != [4,3,2,1] && towers[1] != [4,3,2,1] )
    p "Before"
    p towers

    begin
      puts "Where do you want to move a piece from?"
      start_col = gets.chomp.to_i
      if towers[start_col].empty?
        puts "Oops, didn't work, do it again!"
      end
    end while towers[start_col].empty?

    puts "Where do you want to move the piece to?"
    end_col = gets.chomp.to_i

    move(start_col, end_col, towers)
    p "After"
    p towers
  end
  puts "You Win!!!!!"
end

def move(start_col, end_col, towers)

  if (towers[end_col].empty?)
    towers[end_col] << towers[start_col].pop
  elsif (towers[start_col][-1] < (towers[end_col][-1]))
    towers[end_col] << towers[start_col].pop
  else
    puts "Invalid move, try again!"
  end
end


towers_of_hanoi

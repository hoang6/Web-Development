# def make_change(num, coins)
#   left_coins = coins.select { |coin| coin <= num }
#   return nil if left_coins.count == 0
#
#   p chosen_coin = left_coins[0]
#   if
#
#   elsif chosen_coin == num
#     [chosen_coin]
#   else
#     make_change(num, coins) << make_change(num - chosen_coin, left_coins)
#   end
# end


def make_change(num, coins)
  return nil if left_coins.count == 0

  chosen_coin = coins[0]
  if chosen_coin > num
    coins.drop(1)
  elsif chosen_coin == num
    [chosen_coin]
  else
    exchanges = 
    left_coins = coins.select { |coin| coin <= num }
    make_change(num - chosen_coin, left_coins)
  end
end


p make_change(14, [10, 7, 1])

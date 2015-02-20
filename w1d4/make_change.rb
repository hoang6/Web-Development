def make_change(num, coins)
  left_coins = coins.select { |coin| coin < num }
  p chosen_coin = left_coins[0]

  if left_coins[0] == num
    "checked!"
  else
    make_change(num - chosen_coin, left_coins)
  end
end

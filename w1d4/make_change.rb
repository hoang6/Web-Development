def make_change(num, max, coins)
  return nil if coins.count == 0

  if coins.first == num || num == 0
    [coins.first]
  else
    left_coins = coins.select { |coin| (coin <= num) && (coin <= max) }
    # p "#{left_coins} #{num}"
      make_change(num - left_coins.first, max, left_coins) << left_coins.first
  end
end


def fewer_coins(num, coins)
  coin_num = make_change(num, coins[0], coins).count
  chosen_coin = coins[0]

  coins.drop(1).each do |coin|
    if make_change(num, coin, coins).count < coin_num
      coin_num = make_change(num, coin, coins).count
      chosen_coin = coin
    end
  end

  puts "Biggest coin: #{chosen_coin}"
  make_change(num, chosen_coin, coins)
end

# p make_change(234, 50, [100, 50, 20, 10, 5, 1])
# p fewer_coins(267, [100, 50, 20, 10, 5, 1])

p fewer_coins(14, [10, 7, 1])

# p make_change(23, 7, [10, 7, 1])

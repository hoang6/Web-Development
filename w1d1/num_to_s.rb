def num_to_s(num, base)
  base_16 = {0 => "0", 1 => "1", 2 => "2", 3 => "3",
    4 => "4", 5 => "5", 6 => "6", 7 => "7",
    8 => "8", 9 => "9", 10 => "A", 11 => "B", 12 => "C",
    13 => "D", 14 => "E", 15 => "F"}


  pow = 0
  output = []
  while (num / base ** pow != 0)
    output << ((num / base ** pow) % base)
    pow += 1
  end
  converted_output = output.map do |num|
    base_16[num]
  end
  converted_output.join.reverse
end

p num_to_s(234, 10)
p num_to_s(5, 16)
p num_to_s(234, 16)

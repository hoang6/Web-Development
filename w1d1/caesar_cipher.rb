def caesar_cipher(string, shift)
  letters = string.split('')

  shifted_chars = letters.map do |letter|
    pos = letter.ord

    if pos + shift > 'z'.ord
      (pos - 26 + shift).chr
    else
      (letter.ord + shift).chr
    end
  end

  shifted_chars.join
end

p caesar_cipher('hello', 3)

# Idea: Convert string to array.
# Convert all strings to integers.
# Identify ranges in ASCII. A: 65, Z:90. a: 97, z: 122
# If number in range 65 to 90, subtract 65, then add shift, mod by 26, add 65
# If number in range 97 to 122, subtract 97, add shift, mod by 26, add 97.
# Convert all ints back to char
# Join into string for return

def caesar_cipher(string, shift)
  char_array = string.split('').map(&:ord)
  shift_array = char_array.map do |value|
    if value >= 65 && value <= 90
      value -= 65
      value += shift
      value %= 26
      value + 65

    elsif value >= 97 && value <= 122
      value -= 97
      value += shift
      value %= 26
      value + 97

    else
      value

    end
  end

  shift_array.map(&:chr).join
end

puts caesar_cipher('What a String!', 5)
puts caesar_cipher('What a String!', 295)

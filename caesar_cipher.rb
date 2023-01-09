def caesar_cipher(str, shift)
  # Create a string of all lowercase letters
  lowercase_alphabet = ('a'..'z').to_a.join
  # Create a string of all uppercase letters
  uppercase_alphabet = ('A'..'Z').to_a.join

  # Create shifted versions of the alphabets by shifting the letters by the desired amount
  shifted_lowercase_alphabet = lowercase_alphabet[shift..-1] + lowercase_alphabet[0...shift]
  shifted_uppercase_alphabet = uppercase_alphabet[shift..-1] + uppercase_alphabet[0...shift]

  # Create a hash that maps each letter in the alphabets to its shifted counterpart
  cipher = Hash[lowercase_alphabet.chars.zip(shifted_lowercase_alphabet.chars)]
  cipher.merge!(Hash[uppercase_alphabet.chars.zip(shifted_uppercase_alphabet.chars)])

  # Use the map method to transform each letter in the input string using the cipher hash
  str.chars.map { |c| cipher[c] || c }.join
end

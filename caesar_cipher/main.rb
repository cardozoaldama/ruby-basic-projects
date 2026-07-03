# frozen_string_literal: true

# Caesar Cipher Command Line Application.
# Allows users to encrypt strings using a standard right-shift substitution cipher.

# Implements a simple Caesar Cipher wheel shift (to the right).
#
# @param plaintext [String] the raw string message to be encrypted
# @param shift_factor [Integer] the number of positions to shift right down the alphabet
# @return [String] the encrypted ciphertext string
def caesar_cipher(plaintext, shift_factor = 3)
  # If 0 or negative somehow slips through
  shift_factor = 3 if shift_factor <= 0

  plaintext.chars.map { |char| shift_char(char, shift_factor) }.join
end

# Checks if a single character is an English letter and determines its case base.
#
# @param char [String] a single-character string to evaluate
# @param shift_factor [Integer] the number of positions to shift
# @return [String] the shifted character, or the original character if it is non-alphabetic
def shift_char(char, shift_factor)
  if char.match?(/[A-Z]/)
    rotate_character(char, 'A'.ord, shift_factor)
  elsif char.match?(/[a-z]/)
    rotate_character(char, 'a'.ord, shift_factor)
  else
    char
  end
end

# Performs the modular arithmetic rotation to shift an alphabetic character.
#
# @param char [String] a single-character string representing the letter to shift
# @param base_ascii [Integer] the ASCII integer value base ('A' = 65, 'a' = 97)
# @param shift_factor [Integer] the number of positions to shift right
# @return [String] the newly rotated single-character string
def rotate_character(char, base_ascii, shift_factor)
  (((char.ord - base_ascii) + shift_factor) % 26 + base_ascii).chr
end

puts 'Caesar Cipher!'
puts 'You are going to enter words!'
print 'Insert phrases, letters, or whatever you want: '
plaintext = gets.chomp

puts "\nInsert the shift factor! It will be the right shift."
print 'Insert the shift factor (Default is 3): '
input = gets.chomp

# Stronger validation:
# 1. If the user pressed Enter (empty string), or typed something non-numeric, use default 3.
# 2. Convert to integer, ensure it's positive, and bound it within 0-25 using % 26.
shift_factor = input.match?(/\A\d+\z/) ? input.to_i : 3
shift_factor = 3 if shift_factor.zero?
shift_factor %= 26

puts "\nThis is the result of your phrase."
puts "From: #{plaintext}"
puts "To: #{caesar_cipher(plaintext, shift_factor)}"

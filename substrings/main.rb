# frozen_string_literal: true

# The default dictionary provided in the project specifications.
DICTIONARY = %w[
  below down go going horn how howdy it i low own part partner sit
].freeze

# Maximum allowed characters for user input to prevent memory exhaustion exploits.
MAX_INPUT_LENGTH = 2048

# Computes the frequencies of dictionary words found as substrings within a given text.
# It matches case-insensitively and returns a hash mapping found words to their counts.
#
# @param text [String] the input text or sentence to search within
# @param dictionary [Array<String>] the list of vocabulary words to look for
# @return [Hash{String => Integer}] a hash containing the found dictionary words and their frequencies
def substrings(text, dictionary)
  downcased_text = text.downcase

  dictionary.each_with_object(Hash.new(0)) do |word, frequencies|
    downcased_word = word.downcase
    matches = downcased_text.scan(downcased_word).length
    frequencies[word] = matches if matches.positive?
  end
end

# Validates and sanitizes the user input text.
# Removes non-printable control characters and enforces a maximum length limit.
#
# @param input [String, nil] the raw input from the terminal
# @return [String, nil] the sanitized string, or nil if invalid/dangerous
def sanitize_input(input)
  return nil if input.nil?

  # Remove trailing newline and filter out malicious ASCII control characters
  cleaned = input.chomp.gsub(/[^[:print:]\s]/, '')

  return nil if cleaned.strip.empty? || cleaned.length > MAX_INPUT_LENGTH

  cleaned
end

# Handles the extraction and presentation of the substring counts.
#
# @param raw_input [String, nil] the raw terminal input
# @return [void]
def process_and_display(raw_input)
  clean_text = sanitize_input(raw_input)

  if clean_text.nil?
    puts 'Error: Invalid, empty, or excessively long input detected.'
    return
  end

  result = substrings(clean_text, DICTIONARY)
  puts "\nResults:"
  p result
end

# Prompts the user in the terminal and captures input.
#
# @return [void]
def run_interactive_session
  puts '--- Sub Strings Counter ---'
  print 'Enter your text or sentence: '
  process_and_display(gets)
end

run_interactive_session if __FILE__ == $PROGRAM_NAME

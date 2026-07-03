# frozen_string_literal: true

# Validates whether the given array contains only Numeric values (Integer/Float)
# and is not empty.
#
# @param array [Array<Object>] The array to validate.
# @return [Boolean] true if valid, false otherwise.
def valid_numeric_array?(array)
  return false if array.empty?

  array.all? { |element| element.is_a?(Numeric) }
end

# Checks if an array is already sorted in ascending order.
#
# @param array [Array<Numeric>] The array to inspect.
# @return [Boolean] true if already sorted, false otherwise.
def already_sorted?(array)
  array.each_cons(2).all? { |left, right| left <= right }
end

# Executes a single pass of the bubble sort algorithm over a specified range.
#
# @param array [Array<Numeric>] The array being sorted.
# @param max_index [Integer] The upper bound index for this pass.
# @return [Integer] The last index where a swap occurred.
def bubble_sort_pass!(array, max_index)
  last_swapped_index = 0

  (1...max_index).each do |i|
    if array[i - 1] > array[i]
      array[i - 1], array[i] = array[i], array[i - 1]
      last_swapped_index = i
    end
  end

  last_swapped_index
end

# Performs an optimized bubble sort algorithm on a mutable array of numbers.
# Modifies the array in-place.
#
# @param array [Array<Numeric>] The array of numbers to be sorted.
# @return [Array<Numeric>] The sorted array.
def bubble_sort!(array)
  return array if array.length <= 1 || already_sorted?(array)

  remaining_elements = array.length

  while remaining_elements > 1
    # Shrinks the unsorted window dynamically based on the last swap position
    remaining_elements = bubble_sort_pass!(array, remaining_elements)
  end

  array
end

# Safely converts a user input string into an Integer or Float.
#
# @param input [String] The raw string from standard input.
# @return [Numeric, nil] The parsed number, or nil if invalid.
def parse_number(input)
  trimmed = input.strip
  return nil if trimmed.empty?

  if trimmed.match?(/\A[-+]?\d+\z/)
    trimmed.to_i
  elsif trimmed.match?(/\A[-+]?\d*\.\d+\z/)
    trimmed.to_f
  end
end

# Collects elements from standard input to populate the array.
#
# @param size [Integer] The number of elements requested by the user.
# @return [Array<Object>] The collected input elements.
def collect_user_inputs(size)
  Array.new(size) do |index|
    print "Enter element #{index + 1} of #{size}: "
    raw_input = gets

    if raw_input.nil?
      puts "\nInput interrupted."
      return []
    end

    parsed = parse_number(raw_input)
    parsed.nil? ? raw_input.strip : parsed
  end
end

# Prompts the user for the total size of the array.
#
# @return [Integer, nil] The validated size, or nil if invalid/empty.
def request_array_size
  print 'How many numbers do you want to enter? '
  input = gets
  return nil if input.nil?

  trimmed = input.strip
  return nil unless trimmed.match?(/\A\d+\z/)

  trimmed.to_i
end

# Handles the sorting operation and terminal output presentation.
#
# @param user_array [Array<Object>] The array of collected inputs.
# @return [void]
def process_and_display_sort(user_array)
  unless valid_numeric_array?(user_array)
    puts 'Your list must have only numbers!'
    return
  end

  puts "\nInitial Array: #{user_array.inspect}"
  bubble_sort!(user_array)
  puts "Sorted Array:  #{user_array.inspect}"
end

# Coordinates the execution flow, validations, and input/output interfaces.
#
# @return [void]
def run_application
  size = request_array_size

  if size.nil? || size.zero?
    puts 'Your list is empty!'
    return
  end

  user_array = collect_user_inputs(size)
  process_and_display_sort(user_array)
end

# Execute the application script
run_application

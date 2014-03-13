require 'matrix'

DISPLAY_COLUMN_WIDTH = 7


def number_is_prime?(number)
	number = number.abs
	return false if (number == 0 || number == 1)
	i = 2
	   
	while i <= Math.sqrt(number)
	    return false if number % i == 0
	    i += 1
	end
	return true
end


def get_prime_numbers(quantity = 0)
  primes = []

  index = 2
  until primes.size == quantity do
    primes << index if number_is_prime?(index)
    index += 1
  end

  return primes
end


def build_matrix(axis)
  Matrix.build(axis.size) { |row, column| axis[row] * axis[column] }
end




def print_formatted_cell(value)
  printf("%#{DISPLAY_COLUMN_WIDTH}s|", value)
end


def print_formatted_row(row = [], label = "")
  printf("|")
  print_formatted_cell(label)
  row.each { |element| print_formatted_cell(element) }
  printf("\n")
  puts "-" * ((row.size + 1) * ((DISPLAY_COLUMN_WIDTH + 1)) + 1)
end


def print_formatted_matrix(matrix, labels = [])
  puts "-" * ((labels.size + 1) * ((DISPLAY_COLUMN_WIDTH + 1)) + 1)
  print_formatted_row(labels)
  matrix.to_a.each_with_index { |row, index| print_formatted_row(row, label = labels[index]) }
end


def run_the_test(matrix_size)
  axis = get_prime_numbers(matrix_size)
  matrix = build_matrix(axis)
  print_formatted_matrix(matrix, axis)
end



run_the_test(10)
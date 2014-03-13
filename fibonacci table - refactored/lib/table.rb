require 'matrix'

DISPLAY_COLUMN_WIDTH = 7

module CustomPrime

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

end



include CustomPrime


class MatrixBuilder

  attr_accessor :matrix_values

  @matrix_values_size = 0
  @axis = []
  @matrix_values = []

  def initialize(matrix_size)
    @matrix_values_size = matrix_size
    @axis = CustomPrime::get_prime_numbers(matrix_size)
    @matrix_values = Matrix.build(matrix_size) { |row, column| @axis[row] * @axis[column] }
  end

 
  def print_formatted_matrix
    puts "-" * ((@matrix_values_size + 1) * ((DISPLAY_COLUMN_WIDTH + 1)) + 1)
    print_formatted_row(@axis)
    @matrix_values.to_a.each_with_index { |row, index| print_formatted_row(row, label = @axis[index]) }
  end

  private

  def print_formatted_cell(value = "")
    printf("%#{DISPLAY_COLUMN_WIDTH}s|", value)
  end


  def print_formatted_row(row = [], label = "")
    printf("|")
    print_formatted_cell(label)
    row.each { |element| print_formatted_cell(element) }
    printf("\n")
    puts "-" * ((@matrix_values_size + 1) * ((DISPLAY_COLUMN_WIDTH + 1)) + 1)
  end


end


  matrix = MatrixBuilder.new(10)
  matrix.print_formatted_matrix


require "spec_helper"
require "table"

describe "table" do

    describe CustomPrime do

      describe "#number_is_prime?" do
        specify { CustomPrime::number_is_prime?(0).should be_false }
        specify { CustomPrime::number_is_prime?(1).should be_false }
        specify { CustomPrime::number_is_prime?(2).should be_true }
        specify { CustomPrime::number_is_prime?(3).should be_true }
        specify { CustomPrime::number_is_prime?(4).should be_false }
        specify { CustomPrime::number_is_prime?(5).should be_true }
        specify { CustomPrime::number_is_prime?(6).should be_false }
        specify { CustomPrime::number_is_prime?(7).should be_true }
        specify { CustomPrime::number_is_prime?(8).should be_false }
        specify { CustomPrime::number_is_prime?(9).should be_false }
        specify { CustomPrime::number_is_prime?(10).should be_false }
        specify { CustomPrime::number_is_prime?(11).should be_true }
        specify { CustomPrime::number_is_prime?(12).should be_false }
        specify { CustomPrime::number_is_prime?(13).should be_true }
        specify { CustomPrime::number_is_prime?(14).should be_false }
        specify { CustomPrime::number_is_prime?(15).should be_false }
        specify { CustomPrime::number_is_prime?(16).should be_false }
        specify { CustomPrime::number_is_prime?(17).should be_true }
        specify { CustomPrime::number_is_prime?(18).should be_false }
        specify { CustomPrime::number_is_prime?(19).should be_true }
        specify { CustomPrime::number_is_prime?(20).should be_false }
        specify { CustomPrime::number_is_prime?(21).should be_false }
        specify { CustomPrime::number_is_prime?(22).should be_false }
        specify { CustomPrime::number_is_prime?(23).should be_true }
        specify { CustomPrime::number_is_prime?(24).should be_false }
        specify { CustomPrime::number_is_prime?(25).should be_false }
        specify { CustomPrime::number_is_prime?(26).should be_false }
        specify { CustomPrime::number_is_prime?(27).should be_false }
        specify { CustomPrime::number_is_prime?(28).should be_false }
        specify { CustomPrime::number_is_prime?(29).should be_true }
      end

      describe "#get_prime_numbers" do
        specify { CustomPrime::get_prime_numbers(1).should == [2] }
        specify { CustomPrime::get_prime_numbers(2).should == [2,3] }
        specify { CustomPrime::get_prime_numbers(3).should == [2,3,5] }
        specify { CustomPrime::get_prime_numbers(4).should == [2,3,5,7] }
        specify { CustomPrime::get_prime_numbers(5).should == [2,3,5,7,11] }
        specify { CustomPrime::get_prime_numbers(6).should == [2,3,5,7,11,13] }
        specify { CustomPrime::get_prime_numbers(7).should == [2,3,5,7,11,13,17] }
        specify { CustomPrime::get_prime_numbers(8).should == [2,3,5,7,11,13,17,19] }
        specify { CustomPrime::get_prime_numbers(9).should == [2,3,5,7,11,13,17,19,23] }
        specify { CustomPrime::get_prime_numbers(10).should == [2,3,5,7,11,13,17,19,23,29] }
       end
    end

    describe MatrixBuilder do

       describe "#build_matrix" do
        specify { MatrixBuilder.new(0).matrix_values.should == Matrix.empty }
        specify { MatrixBuilder.new(1).matrix_values.should == Matrix[[4]] }
        specify { MatrixBuilder.new(2).matrix_values.should == Matrix[[4,6],[6,9]] }
        specify { MatrixBuilder.new(10).matrix_values.should == Matrix[[4, 6, 10, 14, 22, 26, 34, 38, 46, 58],
          [6, 9, 15, 21, 33, 39, 51, 57, 69, 87], [10, 15, 25, 35, 55, 65, 85, 95, 115, 145],
          [14, 21, 35, 49, 77, 91, 119, 133, 161, 203], [22, 33, 55, 77, 121, 143, 187, 209, 253, 319],
          [26, 39, 65, 91, 143, 169, 221, 247, 299, 377], [34, 51, 85, 119, 187, 221, 289, 323, 391, 493],
          [38, 57, 95, 133, 209, 247, 323, 361, 437, 551], [46, 69, 115, 161, 253, 299, 391, 437, 529, 667],
          [58, 87, 145, 203, 319, 377, 493, 551, 667, 841]] }
      end

    end

end

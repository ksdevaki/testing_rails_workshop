require "minitest/autorun"

class ArithmeticTest < MiniTest::Unit::TestCase
    def test_one_plus_one_is_two
        assert_equal 2, Arithmetic.new.add(1,1)
    end
    def test_one_plus_one_is_not_zero
        refute_equal 0, Arithmetic.new.add(1,1)
    end
    def test_one_divided_by_zero_float_is_infinity
        assert_equal Float::INFINITY, Arithmetic.new.divide(1.0, 0)
    end
    def test_one_divided_by_zero_int_raises
        assert_raises ZeroDivisionError do
         Arithmetic.new.divide(1, 0)
        end
    end

end

class Arithmetic
    def add a, b
        a + b
    end

    def divide a, b
        a/b
    end

end
require './main'

# Tests for tasks with real numbers and other
class Test < Tasks
  def assert(expected:, actual:)
    puts expected == actual ? 'Passed ' : 'Failed'
  end

  def test_1
    result = { sum: 3, difference: -1, multiplication: 2 }
    assert(expected: result, actual: task_1(number_a: 1, number_b: 2))
  end

  def test_2
    result = 0.3333
    assert(expected: result, actual: task_2(number_a: 2.0, number_b: 1))
  end

  def test_24
    assert(expected: 3,
           actual: task_24(coordinate_x1: 2,
                           coordinate_x2: 2,
                           coordinate_y1: 1,
                           coordinate_y2: 4))
  end

  def test_30
    result = { result1: -434, result2: 186 }
    assert(expected: result, actual: task_30(real_num: 5))
  end

  def test_33
    result = { min: 5, max: 10 }
    assert(expected: result,
           actual: task_33(real_number_x: 5, real_number_y: 10))
  end

  def test_34
    result = { min: 5, max: 20 }
    assert(expected: result,
           actual: task_34(real_number_x: 5,
                           real_number_y: 10,
                           real_number_z: 20))
  end

  def test_41
    actual = task_41.select { |x| x >= 3 && x <= 1 }
    assert(expected: [], actual: actual)
  end

  def test_43
    actual = task_43
    expected = actual[:array].select { |x| x > 0 }.map { |x| x**2 }
    assert(expected: expected, actual: actual[:array2])
  end

  def test_62
    assert(expected: true, actual: task_62(integer: 4))
  end

  def test_64
    assert(expected: 4, actual: task_64(natural_number: 400))
  end

  def test_65
    assert(expected: false, actual: task_65(natural_number: 5))
  end

  def test_67
    result = { digits_number: 3,
               sum: 13,
               last_digit: 6,
               first_digit: 2,
               penultimate_number: 5 }
    assert(expected: result,
           actual: task_67(natural_number: 256))
  end

  def test_207
    assert(expected: 189,
           actual: task_207(natural_number: 1_555_089))
  end

  def test_224
    assert(expected: [1, 5, 25],
           actual: task_224(natural_number: 25))
  end

  def test_225
    assert(expected: [5], actual: task_225(natural_number: 25))
  end

  def test_302
    assert(expected: 3, actual: task_302(natural_number: 2512))
  end

  def test_325
    assert(expected: [1, 3, 5],
           actual: task_325(natural_number: 15))
  end

  def test_328
    result = [1, 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, +
    41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
    assert(expected: result, actual: task_328)
  end

  def test_555
    assert(expected: [[1], [1, 1], [1, 2, 1]],
           actual: task_555(natural_number: 3))
  end

  def test_561
    assert(expected: [1, 5],
           actual: task_561(natural_number: 5))
  end
end

test = Test.new

test.test_1
test.test_2
test.test_24
test.test_30
test.test_33
test.test_34
test.test_41
test.test_43
test.test_62
test.test_64
test.test_65
test.test_67
test.test_207
test.test_224
test.test_225
test.test_302
test.test_325
test.test_328
test.test_555
test.test_561

# Tests for physics tasks
class TestPhysics < Test
  def test_9
    assert(expected: 0.9375,
           actual: task_9(resistance1: 2.5,
                          resistance2: 3,
                          resistance3: 1.5))
  end

  def test_10
    assert(expected: 1.35, actual: task_10(height: 9))
  end

  def test_13
    assert(expected: 2.84, actual: task_13(pendulum_length: 2))
  end
end

# Tests for tasks with array
class TestArray < Test
  def test_number_array
    result = [2, 3]
    assert(expected: result, actual: number_array(digit: 23))
  end

  def test_array_separators
    result = [1, 2, 3, 5, 7]
    assert(expected: result, actual: array_separators(array: (1..10)))
  end

  def test_new_array_length
    array = new_array(quantity: 5, lower_bound: 1, top_bound: 10)
    assert(expected: 5, actual: array.length)
  end

  def test_new_array_diapason
    array = new_array(quantity: 5, lower_bound: 1, top_bound: 10)
    array_check = array.select { |x| x > 10 || x < 1 }
    puts array_check
    assert(expected: [], actual: array_check)
  end

  def test_182
    actual = task_182(natural_number: 5)
    check = []
    actual[:arr_new].each do |x|
      check.push(x) if (x % 5).zero? && x % 7 != 0
    end
    assert(expected: { arr_new: check,
                       sum: check.reduce(:+),
                       quantity: check.length },
           actual: actual)
  end

  def test_185
    actual = task_185(natural_number: 2)
    check = actual[:array].select { |elem| elem < 0 }
    assert(expected: [], actual: check)
  end

  def test_191
    actual = task_191(natural_number: 5)
    check = actual[:array].select { |x| x > 7 }
    assert(expected: [], actual: check)
  end

  def test_205
    actual = task_205(natural_number: 2)
    check = actual[:array]
    max = check.map(&:abs).max
    sum = check.map { |x| x * x }.reduce(:+)
    assert(expected: { array: check, max: max, sum: sum },
           actual: actual)
  end

  def test_272
    actual = task_272
    array_check = actual[:array]
    average = array_check.reduce(:+) / array_check.size
    array_check2 = []
    array_check.each { |x| array_check2.push(x - average) }
    assert(expected: { array: array_check,
                       average: average,
                       deviation: array_check2 },
           actual: actual)
  end

  def test_279
    actual = task_279(natural_number: 5)
    a = actual[:array_a]
    b = actual[:array_b]
    ab = []
    (0..4).each { |i| ab.push(a[i] + b[i]) }
    assert(expected: ab, actual: actual[:array_ab])
  end

  def test_536
    check = false
    result = task_536(natural_number: 5)
    check = true if result[:array] != result[:array].uniq
    assert(expected: check, actual: result[:identical_elements])
  end
end

# Tests for tasks with shapes
class TestShapes < Test
  def test_3
    result = { Volume: 8, Square: 24 }
    assert(expected: result, actual: task_3(edge_length: 2))
  end

  def test_6
    result = { hypotenuse: 3.6056, Square: 3.0 }
    assert(expected: result, actual: task_6(cathetus_a: 2.0, cathetus_b: 3))
  end

  def test_8
    assert(expected: 15_069.1871, actual: task_8(n_corners: 2.0, radius: 3))
  end

  def test_12
    assert(expected: 315.67, actual: task_12(side_of_triangle: 9))
  end

  def test_15
    result = { cathetus_b: 8.77, Square: 0.88 }
    assert(expected: result, actual: task_15(cathetus_a: 2, hypotenuse: 9.0))
  end

  def test_16
    assert(expected: 2.8, actual: task_16(circumference: 5))
  end

  def test_606
    assert(expected: true,
           actual: task_606(side_a: 5,
                            side_b: 1,
                            side_c: 2,
                            side_d: 3))
  end
end

# Tests for games
class TestGame < Test
  def test_check_digit
    assert(expected: 5, actual: check_digit(digit: 5))
  end

  def test_check_digit_fail
    n = check_digit(digit: 25, lower_bound: 1, top_bound: 10)
    if (1..10).cover? n
      'Passed'
    else
      'Failed'
    end
  end

  def test_hint
    result = 'less than needed'
    assert(expected: result, actual: hint(digit1: 2, digit2: 3))
  end

  def test_horse_num
    result = horses_num(run: [1, 2, 3], horse_num: 2)
    check_text = ''
    if result[:run_array][1] == result[:run_array].max
      check_text = 'First'
    elsif result[:run_array][1] == result[:run_array].min
      check_text = 'Last'
    else
      check_text = 'Second'
    end
    assert(expected: check_text, actual: result[:text])
  end
end

game = TestGame.new

game.test_check_digit
game.test_check_digit_fail
game.test_hint
game.test_horse_num

# Tests for tasks with matrix
class TestMatrix < Test
  def test_new_matrix_size
    result = Matrix.rows(new_matrix(n_lines: 3, m_lines: 4))
    assert(expected: [3, 4], actual: [result.row_size, result.column_size])
  end

  def test_697
    actual = task_697(natural_number1: 2,
                      natural_number2: 1,
                      natural_number3: 3)
    assert(expected: { matrix_a: actual[:matrix_a],
                       matrix_b: actual[:matrix_b],
                       result: actual[:matrix_a] * actual[:matrix_b] },
           actual: actual)
  end

  def test_698
    actual = task_698(natural_number: 2)
    matrix = actual[:matrix]
    assert(expected: { matrix: matrix,
                       result: matrix**2 },
           actual: actual)
  end

  def test_699
    actual = task_699(natural_number: 2)
    matrix_a = actual[:matrix_a]
    matrix_b = actual[:matrix_b]
    result = matrix_a * matrix_b - matrix_b * matrix_a
    assert(expected: { matrix_a: matrix_a,
                       matrix_b: matrix_b,
                       result: result },
           actual: actual)
  end

  def test_704
    actual = task_704(natural_number: 2)
    assert(expected: { matrix_a: actual[:matrix_a],
                       matrix_b: actual[:matrix_b],
                       matrix_c: actual[:matrix_c],
                       result: (actual[:matrix_a] + actual[:matrix_b]) *
                           actual[:matrix_c] },
           actual: actual)
  end
end

matrix = TestMatrix.new

matrix.test_new_matrix_size
matrix.test_697
matrix.test_698
matrix.test_699
matrix.test_699
matrix.test_704

# Tests for tasks with date
class TestDate < Test
  def test_822
    assert(expected: '365 days', actual: task_822(year: 2018))
  end

  def test_823
    assert(expected: 1, actual: task_823(year1: 2018,
                                         year2: 2021))
  end

  def test_831
    assert(expected: Time.mktime(2018, 10, 7), actual: task_831(year: 2018))
  end
end

date = TestDate.new

date.test_822
date.test_823
date.test_831

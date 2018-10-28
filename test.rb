
load "main.rb"

class Test
  def assert(expected:, actual:)
    puts expected == actual ? "Passed" : "Failed"
  end

  def test_number_array
    result = [2, 3]
    assert(expected: result, actual: number_array(digit: 23))
  end

  def test_array_separators
    result = [1, 2, 3, 5, 7]
    assert(expected: result, 
           actual: array_separators(array: (1..10)))
  end

  def test_new_matrix_size
    result = Matrix.rows(new_matrix(n: 3, m: 4))
    assert(expected: [3, 4], 
           actual: [result.row_size, result.column_size])
  end

  def test_check_digit
    assert(expected: 5, 
           actual: check_digit(digit: 5))
  end

  def test_check_digit_fail
    n  = check_digit(digit: 25, lower_bound: 1, top_bound: 10)
    puts ((1..10).include?n) ? "Passed" : "Failed"
  end

  def test_new_array_length
    array = new_array(n: 5, x: 1, y: 10)
    assert(expected: 5, 
           actual: array.length)
  end

  def test_new_array_diapason
    array = new_array(n: 5, x: 1, y: 10)
    array_check = array.select{ |x| x > 10 || x < 1}
    puts array_check
    assert(expected: [], 
           actual: array_check)
  end

  def test_hint
    result = "less than needed"
    assert(expected: result, actual: hint(digit1: 2, digit2: 3))
  end

  def test_horse_num
    result = horses_num(run: [1, 2, 3], horse_num: 2)
    check_text = ""
    if result[:run_array][1] == result[:run_array].max
      check_text = "First"
    elsif result[:run_array][1] == result[:run_array].min
      check_text = "Last"
    else
      check_text = "Second"
    end
    assert(expected: check_text, actual: result[:text])
  end

  def test_1
    result = { sum: 3, difference: -1, multiplication: 2 }
    assert(expected: result, actual: task_1(a: 1, b: 2))
  end

  def test_2
    result = 0.3333
    assert(expected: result, actual: task_2(a: 2.0, b: 1))
  end
  
  def test_3
    result = { V: 8, S: 24 }
    assert(expected: result, actual: task_3(l: 2))
  end

  def test_6
    result = { c: 3.6056, S: 3.0 }
    assert(expected: result, actual: task_6(a: 2.0, b: 3))
  end

  def test_8
    assert(expected: 15069.1871, actual: task_8(n: 2.0, r: 3))
  end

  def test_9
    assert(expected: 0.5769, 
          actual: task_9(r1: 2.5, r2: 3, r3: 1.5))
  end

  def test_10
    assert(expected: 1.35, actual: task_10(h: 9))
  end

  def test_12
    assert(expected: 315.67, actual: task_12(n: 9))
  end

  def test_13
    assert(expected: 2.84, actual: task_13(l: 2))
  end

  def test_15
    result = { b: 8.77, S: 0.88 }
    assert(expected: result, actual: task_15(a: 2, c: 9.0))
  end

  def test_16
    assert(expected: 2.8, actual: task_16(l: 5))
  end

  def test_24
    assert(expected: 3, 
           actual: task_24(x1: 2, x2: 2, y1: 1, y2: 4))
  end

  def test_30
    result = { result1: -434, result2: 586 }
    assert(expected: result, actual: task_30(x: 5))
  end

  def test_33
    result = {min: 5, max: 10}
    assert(expected: result, actual: task_33(x: 5, y: 10))
  end

  def test_34
    result = {min: 5, max: 20}
    assert(expected: result, 
           actual: task_34(x: 5, y: 10, z: 20))
  end

  def test_41
    actual = task_41.select{ |x| x >= 3 && x <= 1 }
    assert(expected: [], actual: actual)
  end

  def test_43
    actual = task_43
    expected = actual[:array].select{ |x| x > 0 }.map{ |x| x**2 }
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

  def test_182
    actual = task_182(natural_number: 5)
    check = []
    actual[:arr_new].each{ |x|
      if x % 5 == 0 && x% 7 != 0
        check.push(x)
      end }

    assert(expected: { arr_new: check, 
                       sum: check.reduce(:+), 
                       quantity: check.length }, 
          actual: actual)
  end

  def test_185
    actual = task_185(natural_number: 2)
    check = actual[:array].select{ |elem| elem < 0 }
    assert(expected: [], actual: check)
  end
 
  def test_191
    actual = task_191(natural_number: 5)
    check = actual[:array].select{ |x|
      x > 7 }
    assert(expected: [], actual: check)
  end

  def test_205
    actual = task_205(natural_number: 2)
    check = actual[:array] 
    max = check.map{ |x| x.abs }.max
    sum = check.map{ |x| x*x }.reduce(:+)
    assert(expected: { array: check, max: max, sum: sum }, 
           actual: actual)
  end

  def test_207
    assert(expected: 189, 
          actual: task_207(natural_number: 1555089))
  end

  def test_224
    assert(expected: [1, 5, 25], 
          actual: task_224(natural_number: 25))
  end

  def test_225
    assert(expected: [5], actual: task_225(natural_number: 25))
  end

  def test_272
    actual = task_272
    array_check = actual[:array] 
    average = array_check.reduce(:+)/array_check.size
    array_check2 = []
    array_check.each{ |x| array_check2.push(x - average) }
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
    (0..4).each{ |i| ab.push(a[i] + b[i])}
    assert(expected: ab, actual: actual[:array_ab])
  end

  def test_302
    assert(expected: 3, actual: task_302(natural_number: 2512))
  end

  def test_325
    assert(expected: [1, 3, 5], 
          actual: task_325(natural_number: 15))
  end

  def test_328
    result = [1, 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
    assert(expected: result, actual: task_328)
  end

  def test_536
    check = false
    result = task_536(natural_number: 5)
    check = true if result[:array] != result[:array].uniq
    assert(expected: check, 
          actual: result[:identical_elements])
  end

  def test_555
    assert(expected: [[1], [1, 1], [1, 2, 1]], 
          actual: task_555(natural_number: 3))
  end

  def test_561
    assert(expected: [1, 5], 
          actual: task_561(natural_number: 5))
  end

  def test_606
    assert(expected: true, 
          actual: task_606(a: 5, b: 1, c: 2, d: 3))
  end

  def test_697
    actual = task_697(natural_number1: 2,
                      natural_number2: 1,
                      natural_number3: 3)
    matrix_A = actual[:matrix_A]
    matrix_B = actual[:matrix_B]
    assert(expected: { matrix_A: matrix_A,
                       matrix_B: matrix_B,
                       result: matrix_A * matrix_B }, 
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
    matrix_A = actual[:matrix_A]
    matrix_B = actual[:matrix_B]
    result = matrix_A * matrix_B - matrix_B * matrix_A
    assert(expected: { matrix_A: matrix_A,
                       matrix_B: matrix_B,
                       result: result }, 
          actual: actual)
  end

  def test_704
    actual = task_704(natural_number: 2)
    matrix_A = actual[:matrix_A]
    matrix_B = actual[:matrix_B]
    matrix_C = actual[:matrix_C]
    result = (matrix_A + matrix_B) * matrix_C
    assert(expected: { matrix_A: matrix_A,
                       matrix_B: matrix_B,
                       matrix_C: matrix_C,
                       result: result }, 
          actual: actual)
  end

  def test_822
    assert(expected: "365 days", actual: task_822(year: 2018))
  end

  def test_823
    assert(expected: 1, actual: task_823(year1: 2018, year2: 2021))
  end

  def test_831
    assert(expected: Time.mktime(2018, 10, 7), 
          actual: task_831(year: 2018))
  end
end

test = Test.new

test.test_number_array
test.test_array_separators
test.test_new_matrix_size
test.test_check_digit
test.test_check_digit_fail
test.test_new_array_length
test.test_new_array_diapason
test.test_hint
test.test_horse_num
test.test_1
test.test_2
test.test_3
test.test_6
test.test_8
test.test_9
test.test_10
test.test_12
test.test_13
test.test_15
test.test_16
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
test.test_182
test.test_185
test.test_191
test.test_205
test.test_207
test.test_224
test.test_225
test.test_272
test.test_279
test.test_302
test.test_325
test.test_328
test.test_536
test.test_555
test.test_561
test.test_606
test.test_697
test.test_698
test.test_699
test.test_699
test.test_704
test.test_822
test.test_823
test.test_831
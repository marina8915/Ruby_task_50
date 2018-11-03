$LOAD_PATH.unshift('.')

require 'matrix'
require 'test'

# 50 tasks
class Tasks
  def task(num:)
    puts "\n Task #{num}"
  end

  # number => array, example 234 => [2, 3, 4]
  def number_array(digit:)
    digit.to_s.split('').map(&:to_i)
  end

  # array of prime numbers
  def array_separators(array:)
    array.select { |x| (1..x).select { |y| (x % y).zero? }.length <= 2 }
  end

  # matrix n x m
  def new_matrix(n_lines:, m_lines:)
    array = []
    (0..(n_lines - 1)).each do |i|
      array[i] = []
      (0..(m_lines - 1)).each { array[i].push(rand(1..10)) }
    end
    print array, "\n"
    array
  end

  # if digit not in diapason lower_bound..top_bound enter new n
  def check_digit(digit:, lower_bound: 1, top_bound: 10)
    until (lower_bound..top_bound).cover? digit
      puts 'incorrect value'
      puts 'take again'
      digit = gets.to_i
    end
    digit
  end

  # array with random digits in diapason lower_bound..y
  def new_array(quantity:, lower_bound: -100, top_bound: 100)
    array = []
    quantity.times { array.push(rand(lower_bound..top_bound)) }
    print "Elements: #{array} \n"
    array
  end

  # hint when comparing numbers
  def hint(digit1:, digit2:)
    if digit1 > digit2
      'more than needed'
    elsif digit1 < digit2
      'less than needed'
    end
  end

  def task_1(number_a:, number_b:)
    task(num: 1)
    { sum: number_a + number_b,
      difference: number_a - number_b,
      multiplication: number_a * number_b }
  end

  def task_2(number_a:, number_b:)
    task(num: 2)
    ((number_a.abs - number_b.abs) / (1 + (number_a * number_b).abs)).round(4)
  end

  def task_3(edge_length:)
    task(num: 3)
    { Volume: edge_length**3, Square: edge_length**2 * 6 }
  end

  def task_6(cathetus_a:, cathetus_b:)
    task(num: 6)
    { hypotenuse: Math.sqrt(cathetus_a**2 + cathetus_b**2).round(4),
      Square: cathetus_a * cathetus_b / 2 }
  end

  def task_8(n_corners:, radius:)
    task(num: 8)
    result = 2 * radius * Math.tan(3.14 / n_corners) * n_corners
    result.round(4)
  end

  def task_9(resistance1:, resistance2:, resistance3:)
    task(num: 9)
    (1 / (1 / resistance1 + 1 / resistance2 + 1 / resistance3)).round(4)
  end

  def task_10(height:)
    task(num: 10)
    result = Math.sqrt((2 * height) / 9.81)
    result.round(2)
  end

  def task_12(side_of_triangle:)
    task(num: 12)
    result = Math.sqrt(3) * side_of_triangle / 4 * side_of_triangle**2
    result.round(2)
  end

  def task_13(pendulum_length:)
    task(num: 13)
    (2 * 3.14 * Math.sqrt(pendulum_length / 9.81)).round(2)
  end

  def task_15(cathetus_a:, hypotenuse:)
    task(num: 15)
    cathetus_b = Math.sqrt(hypotenuse**2 - cathetus_a**2).round(2)
    { cathetus_b: cathetus_b,
      Square: ((cathetus_a + cathetus_b - hypotenuse) / 2).round(2) }
  end

  def task_16(circumference:)
    task(num: 16)
    result = Math::PI * Math.sqrt(circumference / (2 * Math::PI))
    result.round(2)
  end

  def task_24(coordinate_x1:, coordinate_x2:, coordinate_y1:, coordinate_y2:)
    task(num: 24)
    difference_x = coordinate_x1 - coordinate_x2
    difference_y = coordinate_y1 - coordinate_y2
    result = Math.sqrt(difference_x**2 + difference_y**2)
    result.round(2)
  end

  def task_30(real_num:)
    task(num: 30)
    degree3 = real_num**3
    middle = 2 * real_num + 3 * real_num**2
    res1 = 1 - middle - 4 * degree3
    res2 = 1 + middle + 4 * degree3
    { result1: res1, result2: res2 }
  end

  def task_33(real_number_x:, real_number_y:)
    task(num: 33)
    array = [real_number_x, real_number_y]
    { min: array.min, max: array.max }
  end

  def task_34(real_number_x:, real_number_y:, real_number_z:)
    task(num: 34)
    array = [real_number_x, real_number_y, real_number_z]
    { min: array.min, max: array.max }
  end

  def task_41(natural_number = 3)
    task(num: 41)
    new_array(quantity: natural_number).select { |x| x <= 3 && x >= 1 }
  end

  def task_43(natural_number = 3)
    task(num: 43)
    array = new_array(quantity: natural_number)
    array2 = array.select { |x| x > 0 }.map { |x| x**2 }
    { array: array, array2: array2 }
  end

  def task_62(integer:)
    task(num: 62)
    (integer % 2).zero?
  end

  def task_64(natural_number:)
    task(num: 64)
    natural_number / 100
  end

  def task_65(natural_number:)
    task(num: 65)
    sum_array = number_array(digit: natural_number).reduce(:+)
    sum_array**3 == natural_number**2
  end

  def task_67(natural_number:)
    task(num: 67)
    array = number_array(digit: natural_number)
    penultimate_number = array[array.length - 2] if natural_number >= 10
    { digits_number: array.length,
      sum: array.reduce(:+),
      last_digit: array[array.length - 1],
      first_digit: array[0],
      penultimate_number: penultimate_number }
  end

  def task_182(natural_number:)
    task(num: 182)
    array = new_array(quantity: natural_number)
    array2 = array.select { |elem| (elem % 5).zero? && elem % 7 != 0 }
    { arr_new: array2,
      sum: array2.reduce(:+),
      quantity: array2.length }
  end

  def task_185(natural_number:)
    task(num: 185)
    array = new_array(quantity: natural_number)
    array2 = array.select { |elem| elem > 0 }
    sum = if array2 != []
            array2.reduce(:+)**2
          else
            0
          end
    { array: array2, sum: sum }
  end

  def task_191(natural_number:)
    task(num: 191)
    quantity = 0
    array = new_array(quantity: natural_number)
    array.map! do |elem|
      quantity += 1 if elem > 7
      elem > 7 ? 7 : elem
    end
    { array: array, quantity: quantity }
  end

  def task_205(natural_number:)
    task(num: 205)
    array = new_array(quantity: natural_number)
    { array: array,
      max: array.map(&:abs).max,
      sum: array.map { |x| x * x }.reduce(:+) }
  end

  def task_207(natural_number:)
    task(num: 207)
    arr = number_array(digit: natural_number).delete_if do |x|
      x.zero? || x == 5
    end
    arr.join.to_i
  end

  def task_224(natural_number:)
    task(num: 224)
    (1..natural_number).select { |x| (natural_number % x).zero? }
  end

  def task_225(natural_number:)
    task(num: 225)
    (1..natural_number).select do |x|
      (natural_number % x**2).zero? && natural_number % x**3 != 0
    end
  end

  def task_230(natural_number:)
    task(num: 230)
    min = 1000
    num_array = new_array(quantity: natural_number)
    num_array.inject do |x, y|
      min = (x - y).abs if (x - y).abs < min
      y
    end
    min
  end

  def task_272(natural_number = 50)
    task(num: 272)
    precipitation = new_array(quantity: natural_number,
                              lower_bound: 1,
                              top_bound: 100)
    average = precipitation.reduce(:+) / precipitation.size
    deviation = []
    precipitation.each { |x| deviation.push(x - average) }
    { array: precipitation,
      average: average,
      deviation: deviation }
  end

  def task_279(natural_number:)
    task(num: 279)
    a = new_array(quantity: natural_number)
    b = new_array(quantity: natural_number).reverse!
    ab = []
    (0..natural_number - 1).each { |i| ab.push(a[i] + b[i]) }
    { array_a: a, array_b: b, array_ab: ab }
  end

  def task_302(natural_number:)
    task(num: 302)
    number = number_array(digit: natural_number)
    number.uniq!
    number.length
  end

  def task_317(natural_number = 10)
    task(num: 317)
    array = new_array(quantity: natural_number)
    sum_array = 0
    (0..natural_number - 1).each { |i| sum_array += array[i]**(i + 1) }
  end

  def task_325(natural_number:)
    task(num: 325)
    separators = (1..natural_number).select { |x| (natural_number % x).zero? }
    array_separators(array: separators)
  end

  def task_328(lower_bound = 1, top_bound = 100)
    task(num: 328)
    array_separators(array: (lower_bound..top_bound))
  end

  def task_536(natural_number:)
    task(num: 536)
    array = new_array(quantity: natural_number)
    { array: array, identical_elements: array != array.uniq }
  end

  def task_555(natural_number:)
    task(num: 555)
    puts 'pascals triangle'
    a = []
    (0..natural_number - 1).each do |i|
      a[i] = []
      a[i].push(1)
      if i > 0
        (0..a[i - 1].size - 2).each do |j|
          a[i].unshift(a[i - 1][j] + a[i - 1][j + 1])
        end
        a[i].unshift(1)
      end
      print a[i], "\n"
    end
    a
  end

  def task_561(natural_number:)
    task(num: 561)
    new_array = []
    (1..natural_number).each do |s|
      array = number_array(digit: s * s)
      if array.last(number_array(digit: s).size).join.to_i == s
        new_array.push(s)
      end
    end
    new_array
  end

  def task_606(side_a:, side_b:, side_c:, side_d:)
    task(num: 606)
    rectangle = [side_a, side_b, side_c, side_d]
    sum_rectangle = rectangle.reduce(:+)
    rectangle_flag = true
    (0..3).each do |i|
      rectangle_flag = false if (sum_rectangle - rectangle[i]) < rectangle[i]
    end
    rectangle_flag
  end

  def task_697(natural_number1:, natural_number2:, natural_number3:)
    task(num: 697)
    matrix_a = Matrix.rows(new_matrix(n_lines: natural_number1,
                                      m_lines: natural_number2))
    matrix_b = Matrix.rows(new_matrix(n_lines: natural_number2,
                                      m_lines: natural_number3))
    { matrix_a: matrix_a,
      matrix_b: matrix_b,
      result: matrix_a * matrix_b }
  end

  def task_698(natural_number:)
    task(num: 698)
    matrix = Matrix.rows(new_matrix(n_lines: natural_number,
                                    m_lines: natural_number))
    { matrix: matrix, result: matrix**2 }
  end

  def task_699(natural_number:)
    task(num: 699)
    matrix_a = Matrix.rows(new_matrix(n_lines: natural_number,
                                      m_lines: natural_number))
    matrix_b = Matrix.rows(new_matrix(n_lines: natural_number,
                                      m_lines: natural_number))
    result = matrix_a * matrix_b - matrix_b * matrix_a
    { matrix_a: matrix_a,
      matrix_b: matrix_b,
      result: result }
  end

  def task_704(natural_number:)
    task(num: 704)
    matrix_a = Matrix.rows(new_matrix(n_lines: natural_number,
                                      m_lines: natural_number))
    matrix_b = Matrix.rows(new_matrix(n_lines: natural_number,
                                      m_lines: natural_number))
    matrix_c = Matrix.rows(new_matrix(n_lines: natural_number,
                                      m_lines: natural_number))
    { matrix_a: matrix_a, matrix_b: matrix_b,
      matrix_c: matrix_c, result: (matrix_a + matrix_b) * matrix_c }
  end

  def task_710(natural_number1:, natural_number2:)
    task(num: 710)
    m = Matrix.rows(new_matrix(n_lines: natural_number1,
                               m_lines: natural_number2))
    m.transpose
  end

  def task_822(year:)
    task(num: 822)
    (year % 4).zero? ? '366 days' : '365 days'
  end

  def task_823(year1:, year2:)
    task(num: 823)
    leap_years = 0
    (year1..year2).each { |y| leap_years += 1 if (y % 4).zero? }
    leap_years
  end

  def task_831(year:)
    task(num: 831)
    october = Time.mktime(year, 10, 1)
    day1 = october.wday
    if day1 < 7
      day = 7 - day1
      Time.mktime(year, 10, day + 1)
    else
      Time.mktime(year, 10, day1)
    end
  end

  def task_986
    task(num: 986)
    digit = rand(0..9)
    digit_user = ''
    3.times do
      puts 'Guess the digit (0..9)'
      digit_user = check_digit(digit: gets.to_i, lower_bound: 0, top_bound: 9)
      break if digit_user == digit

      puts hint(digit1: digit_user, digit2: digit)
    end
    puts digit_user != digit ? "You did not guess #{digit}" : 'Right you are!'
  end

  # select horse, task 988
  def select_horse
    puts horses = { 1 => 'Watercolor', 2 => 'Alpha', 3 => 'Gallop' }
    puts 'Select horses (1..3)'
    horse_num = check_digit(digit: gets.to_i, lower_bound: 1, top_bound: 3)
    puts horses[horse_num]
    horse_num
  end

  # place of the horse, task 988
  def horses_num(run:, horse_num:)
    run.map! { |x| x + rand(1..100) }
    text = if run[horse_num - 1] == run.max
             'First'
           elsif run[horse_num - 1] == run.min
             'Last'
           else
             'Second'
           end
    puts text
    run
  end

  def task_988
    task(num: 988)
    horse_num = select_horse
    finish = 500
    horses_run = []
    3.times { horses_run.push(rand(1..100)) }
    while horses_run.max < finish
      horses_run = horses_num(run: horses_run, horse_num: horse_num)
    end
    puts horses_run[horse_num - 1] >= finish ? 'Victory!' : 'Try again.'
  end

  # result game 100 matches
  def matches_result(first:, second:)
    if first > second
      'First is won'
    elsif first == second
      'Won friendship'
    else
      'Second is won'
    end
  end

  def task_1009
    puts 'Game - 100 matches \n must take from 1 to 10 matches'
    first_player = 0
    second_player = 0
    until first_player >= 100 || second_player >= 100
      puts 'first player'
      first_player += check_digit(digit: gets.to_i)
      puts 'second player'
      second_player += check_digit(digit: gets.to_i)
    end
    puts matches_result(first: first_player, second: second_player)
  end
end

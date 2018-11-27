require 'tasks/version'
require 'matrix'
require 'conditions'

module Tasks
  class Error < StandardError; end

  # 50 tasks
  class Task
    class << self
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
        array
      end

      # array with random digits in diapason lower_bound..y
      def new_array(quantity:, lower_bound: -100, top_bound: 100)
        array = []
        quantity.times { array.push(rand(lower_bound..top_bound)) }
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

      def task_1(a:, b:)
        sum = a + b
        diff = a - b
        mult = a * b
        { sum: sum.round(2),
          difference: diff.round(2),
          multiplication: mult.round(2) }
      end

      def task_2(x:, y:)
        difference = x.abs - y.abs
        multiplication = (x * y).abs
        (difference / (1 + multiplication)).round(4)
      end

      def task_3(edge_length:)
        volume = edge_length**3
        square = edge_length**2 * 6
        { Volume: volume.round(2), Square: square.round(2) }
      end

      def task_6(cathetus_a:, cathetus_b:)
        hypotenuse = Math.sqrt(cathetus_a**2 + cathetus_b**2).round(2)
        square = (cathetus_a * cathetus_b / 2).round(2)
        { hypotenuse: hypotenuse, Square: square }
      end

      def task_8(n_corners:, radius:)
        result = 2 * radius * Math.tan(3.14 / n_corners) * n_corners
        { Perimeter: result.round(4) }
      end

      def task_9(resistance1:, resistance2:, resistance3:)
        (1 / (1 / resistance1 + 1 / resistance2 + 1 / resistance3)).round(4)
      end

      def task_10(height:)
        result = Math.sqrt((2 * height) / 9.81)
        { time: result.round(2) }
      end

      def task_12(side_of_triangle:)
        result = Math.sqrt(3) * side_of_triangle / 4 * side_of_triangle**2
        { Square: result.round(2) }
      end

      def task_13(pendulum_length:)
        result = (2 * 3.14 * Math.sqrt(pendulum_length / 9.81)).round(2)
        { period: result }
      end

      def task_15(cathetus_a:, hypotenuse:)
        cathetus_b = Math.sqrt(hypotenuse**2 - cathetus_a**2)
        square = ((cathetus_a + cathetus_b - hypotenuse) / 2).round(2)
        { cathetus_b: cathetus_b.round(2), Square: square }
      end

      def task_16(circumference:)
        result = Math::PI * Math.sqrt(circumference / (2 * Math::PI))
        { Square: result.round(2) }
      end

      def task_24(x1:, x2:, y1:, y2:)
        diff_x = x1 - x2
        diff_y = y1 - y2
        result = Math.sqrt(diff_x**2 + diff_y**2)
        result.round(2)
      end

      def task_30(x:)
        degree3 = x**3
        middle = 2 * x + 3 * x**2
        res1 = 1 - middle - 4 * degree3
        res2 = 1 + middle + 4 * degree3
        { result1: res1.round(2), result2: res2.round(2) }
      end

      def task_33(x:, y:)
        array = [x, y]
        { min: array.min, max: array.max }
      end

      def task_34(x:, y:, z:)
        array = [x, y, z]
        { min: array.min, max: array.max }
      end

      def task_39(digit1:, digit2:)
        digit1 > digit2 ? digit1 : [digit1, digit2]
      end

      def task_41(x:, y:, z:)
        array = [x, y, z]
        array.select { |x| x <= 3 && x >= 1 }
      end

      def task_43(x:, y:, z:)
        array = [x, y, z]
        array.select { |x| x > 0 }.map { |x| x**2 }
      end

      def task_62(digit:)
        digit.to_i
        (digit % 2).zero? ? 'yes' : 'no'
      end

      def task_64(digit:)
        (digit / 100).to_i
      end

      def task_65(digit:)
        sum_array = number_array(digit: digit.to_i).reduce(:+)
        sum_array**3 == digit**2 ? 'yes' : 'no'
      end

      def task_67(digit:)
        digit = digit.to_i
        array = number_array(digit: digit)
        penultimate_number = array[array.length - 2] if digit >= 10
        { digits_number: array.length,
          sum: array.reduce(:+),
          last_digit: array[array.length - 1],
          first_digit: array[0],
          penultimate_number: penultimate_number }
      end

      def task_182(n:)
        array = new_array(quantity: n.to_i)
        array2 = array.select { |elem| (elem % 5).zero? && elem % 7 != 0 }
        sum = array2.reduce(:+)
        { arr_new: array2, sum: sum, quantity: array2.length }
      end

      def task_185(n:)
        array = new_array(quantity: n.to_i)
        array2 = array.select { |elem| elem > 0 }
        sum = if array2 != []
                array2.reduce(:+)**2
              else
                0
              end
        { array: array2, sum: sum }
      end

      def task_191(n:)
        quantity = 0
        array = new_array(quantity: n.to_i)
        array.map! do |elem|
          quantity += 1 if elem > 7
          elem > 7 ? 7 : elem
        end
        { array: array, quantity: quantity }
      end

      def task_205(n:)
        array = new_array(quantity: n.to_i)
        max = array.map(&:abs).max
        sum = Math.sqrt(array.map { |x| x * x }.reduce(:+))
        { array: array, max: max, sum: sum }
      end

      def task_207(n:)
        arr = number_array(digit: n.to_i).delete_if do |x|
          x.zero? || x == 5
        end
        arr.join.to_i
      end

      def task_224(n:)
        n = n.to_i
        (1..n).select { |x| (n % x).zero? }
      end

      def task_225(n:)
        n = n.to_i
        (1..n).select {|x| (n % x**2).zero? && n % x**3 != 0 }
      end

      def task_230(n:)
        min = 1000
        num_array = new_array(quantity: n.to_i)
        num_array.inject do |x, y|
          min = (x - y).abs if (x - y).abs < min
          y
        end
        { array: num_array, min: min }
      end

      def task_272(n:)
        precipitation = new_array(quantity: n.to_i,
                                  lower_bound: 1,
                                  top_bound: 100)
        average = precipitation.reduce(:+) / precipitation.size
        deviation = []
        precipitation.each { |x| deviation.push(x - average) }
        { precipitation: precipitation, average: average, deviation: deviation }
      end

      def task_279(n:)
        n = n.to_i
        a = new_array(quantity: n)
        b = new_array(quantity: n).reverse!
        ab = []
        (0..n - 1).each { |i| ab.push(a[i] + b[i]) }
        { array_a: a, array_b: b, array_ab: ab }
      end

      def task_302(n:)
        number = number_array(digit: n.to_i)
        number.uniq!
        number.length
      end

      def task_317(n:)
        n = n.to_i
        array = new_array(quantity: n)
        sum_array = 0
        (0..n - 1).each { |i| sum_array += array[i]**(i + 1) }
        { array: array, sum: sum_array }
      end

      def task_325(n:)
        n = n.to_i
        separators = (1..n).select do |x|
          (n % x).zero?
        end
        array_separators(array: separators)
      end

      def task_328
        array_separators(array: (1..100))
      end

      def task_536(n:)
        array = new_array(quantity: n.to_i)
        result = array != array.uniq ? 'yes' : 'no'
        { array: array, identical_elements: result }
      end

      def task_555(n:)
        n.to_i
        a = []
        (0..n - 1).each do |i|
          a[i] = []
          a[i].push(1)
          if i > 0
            (0..a[i - 1].size - 2).each do |j|
              a[i].unshift(a[i - 1][j] + a[i - 1][j + 1])
            end
            a[i].unshift(1)
          end
        end
        a
      end

      def task_561(n:)
        n = n.to_i
        new_array = []
        (1..n).each do |s|
          array = number_array(digit: s * s)
          if array.last(number_array(digit: s).size).join.to_i == s
            new_array.push(s)
          end
        end
        new_array
      end

      def task_606(a:, b:, c:, d:)
        rectangle = [a, b, c, d]
        sum = rectangle.reduce(:+)
        rectangle_flag = true
        (0..3).each do |i|
          rectangle_flag = false if (sum - rectangle[i]) < rectangle[i]
        end
        rectangle_flag ? 'yes' : 'no'
      end

      def task_697(k:, m:, l:)
        k = k.to_i
        m = m.to_i
        l = l.to_i
        matrix_a = Matrix.rows(new_matrix(n_lines: k, m_lines: m))
        matrix_b = Matrix.rows(new_matrix(n_lines: m, m_lines: l))
        mult = matrix_a * matrix_b
        { matrix_a: matrix_a, matrix_b: matrix_b, result: mult }
      end

      def task_698(n:)
        n = n.to_i
        matrix = Matrix.rows(new_matrix(n_lines: n, m_lines: n))
        { matrix: matrix, result: matrix**2 }
      end

      def task_699(n:)
        n = n.to_i
        matrix_a = Matrix.rows(new_matrix(n_lines: n, m_lines: n))
        matrix_b = Matrix.rows(new_matrix(n_lines: n, m_lines: n))
        result = matrix_a * matrix_b - matrix_b * matrix_a
        { matrix_a: matrix_a, matrix_b: matrix_b, result: result }
      end

      def task_704(n:)
        n = n.to_i
        matrix_a = Matrix.rows(new_matrix(n_lines: n, m_lines: n))
        matrix_b = Matrix.rows(new_matrix(n_lines: n, m_lines: n))
        matrix_c = Matrix.rows(new_matrix(n_lines: n, m_lines: n))
        result = (matrix_a + matrix_b) * matrix_c
        { matrix_a: matrix_a, matrix_b: matrix_b,
          matrix_c: matrix_c, result: result }
      end

      def task_710(m:, n:)
        matrix = Matrix.rows(new_matrix(n_lines: m.to_i, m_lines: n.to_i))
        matrix.transpose
      end

      def task_822(year:)
        (year.to_i % 4).zero? ? '366 days' : '365 days'
      end

      def task_823(n:, m:)
        n = n.to_i
        m = m.to_i
        leap_years = 0
        (n..m).each { |y| leap_years += 1 if (y % 4).zero? }
        leap_years
      end

      def task_831(n:)
        n = n.to_i
        october = Time.mktime(n, 10, 1)
        day1 = october.wday
        if day1 < 7
          day = 7 - day1
          Time.mktime(n, 10, day + 1)
        else
          Time.mktime(n, 10, day1)
        end
      end

      def task_986(n:)
        digit = rand(0..9)
        digit_user = n.to_i
        return 'incorrect value' unless (0..9).cover? digit_user

        digit_user != digit ? hint(digit1: digit_user, digit2: digit) : 'Right you are!'
      end

      # place of the horse, task 988
      def horse_place(run:, horse_num:)
        horse_num -= 1
        if run[horse_num] == run.max
          'Victory!'
        elsif run[horse_num] == run.min
          'Last.'
        else
          'Second.'
        end
      end

      def task_988(horse_num:)
        horse_num = horse_num.to_i
        return 'incorrect value' unless (1..3).cover? horse_num

        finish = 500
        horses_run = []
        3.times { horses_run.push(rand(1..100)) }
        while horses_run.max < finish
          horses_run.map! { |x| x + rand(1..100) }
        end
        horse_place(run: horses_run, horse_num: horse_num)
      end

      # return array with numbers of all tasks
      def all_tasks
        method_name = 'task_'
        methods = Task.methods(false)
        tasks = methods.select { |elem| elem.to_s.include? method_name }
        tasks.map! { |elem| elem.to_s.delete method_name }
        tasks.map!(&:to_i).sort!
      end

      # return task condition by number
      def conditions(num:)
        num = num.to_i
        if all_tasks.include? num
          CONDITIONS[num]
        else
          'Task not found.'
        end
      end
    end
  end
end

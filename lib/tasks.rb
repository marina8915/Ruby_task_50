require "tasks/version"
require "matrix"

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
          multiplication: mult.round(2)
        }
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
        digit_user = check_digit(digit: n.to_i, lower_bound: 0, top_bound: 9)
        digit_user != digit ? hint(digit1: digit_user, digit2: digit) : 'Right you are!'
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

      def task_988(horse_num:)
        horse_num = horse_num.to_i
        horse_num = 1 if (1..3).include? horse_num
        finish = 500
        horses_run = []
        3.times { horses_run.push(rand(1..100)) }
        while horses_run.max < finish
          horses_run = horses_num(run: horses_run, horse_num: horse_num)
        end
        horses_run[horse_num - 1] >= finish ? 'Victory!' : 'Try again.'
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

      def conditions(num:)
        case num.to_i
        when 1
          'Даны два действительных числа a и b. Получить их сумму, разность и произведение.'
        when 2
          'Даны действительные числа x и y. Получить (|x| -|y|)/(1 + xy) '
        when 3
          'Дана длина ребра куба. Найти объем куба и площадь его боковой поверхности.'
        when 6
          'Даны катеты прямоугольного треугольника. Найти его гипотенузу и площадь.'
        when 8
          'Определить периметр правильного n-угольника, описанного около окружности радиуса r.'
        when 9
          'Три сопротивления R1, R2, R3 соединены параллельно. Найти сопротивление соединения.'
        when 10
          'Определить время падения камня на поверхность земли с высоты h.'
        when 12
          'Дана сторона равностороннего треугольника. Найти площадь этого треугольника.'
        when 13
          'Вычислить период колебания маятника длины l.'
        when 15
          'Даны гипотенуза и катет прямоугольного треугольника. Найти второй катет и радиус
вписанной окружности.'
        when 16
          'Известна длина окружности. Найти площадь круга, ограниченного этой окружностью.'
        when 24
          'Вычислить расстояние между двумя точками с координатами x1,y1 и x2,y2.'
        when 30
          'Дано действительное число х. Не пользуясь никакими другими арифметическими операциями,
кроме умножения, сложения и вычитания, вычислить: 1−2x +3x^2 −4x^3 и 1+2x +3x^2 +4x^3.
Разрешается использовать не более восьми операций.'
        when 33
          'Даны действительные числа х, у. Получить: max (x, y), min (x, y).'
        when 34
          'Даны действительные числа x, y, z. Получить: min (x, y, z), max(x, y, z).'
        when 41
          'Даны три действительных числа. Выбрать из них те, которые принадлежат интервалу (1, 3).'
        when 43
          'Даны три действительных числа. Возвести в квадрат те из них, значения которых неотрицательны.'
        when 62
          'Определить, является ли данное целое число четным.'
        when 64
          'Дано натуральное число n (n > 99). Определить число сотен в нем.'
        when 65
          'Дано натуральное число n (n>99). Выяснить, верно ли, что n^2 равно кубу суммы цифр числа n.'
        when 67
          'Дано натуральное число n (n ≤ 100):
          а) Сколько цифр в числе n?
          б) Чему равна сумма его цифр?
          в) Найти последнюю цифру числа n.
          г) Найти первую цифру числа n.
          д) В предположении, что n ≥ 10, найти предпоследнюю цифру числа n.'
        when 182
          'Дано натуральное число n.В массиве a1, …, an найти количество и сумму тех членов
данной последовательности, которые делятся на 5 и не делятся на 7.'
        when 185
          'Дано натуральное число n. Получить удвоенную сумму всех положительных членов последовательности a1, …, an.'
        when 191
          'Дано натуральное число n. Заменить все большие семи члены последовательности a1, …, an числом 7.
Вычислить количество таких членов.'
        when 205
          'Дано натуральное число n. Получить max(a1, …, an) и sqrt(a1^2 + ... +an^2).'
        when 207
          'Дано натуральное число n. Выбросить из записи числа n цифры 0 и 5,
оставив прежним порядок остальных цифр. Например, из числа 59015509 должно получиться 919.'
        when 224
          'Дано натуральное число n. Получить все его натуральные делители.'
        when 225
          'Дано натуральное число n. Получить все такие натуральные q, что n делится на q^2 и не делится на q^3.'
        when 230
          'Дано натуральное число n. Найти длину наименьшего отрезка числовой оси, содержащего числа
a1, …, an.'
        when 272
          'Даны действительные числа а1901, a1902, …,аn – количество осадков (в миллиметрах),
выпавших в Москве в течение первых n лет нашего столетия.
Надо вычислить среднее количество осадков и отклонение от среднего для каждого года.'
        when 279
          'Дано действительные числа n. Вычислить для  a1, …, an, b1, …, bn:
(a1+bn)(a2+bn-1)...(an+b1).'
        when 302
          'Дано натуральное число n. Сколько различных цифр встречается в его десятичной записи?'
        when 317
          'Дано натуральное число n, для  a1, …, a10 вычислить a1 + a2^2 + ... + a10^10'
        when 325
          'Дано натуральное число n. Получить все простые делители этого числа.'
        when 328
          'Найти 100 первых простых чисел.'
        when 536
          'Дано натуральное число n. Выяснить, имеются ли среди чисел a1, ..., an совпадающие.'
        when 555
          'Дано натуральное n. Получить первые n строк треугольника Паскаля.
Треугольником Паскаля называется числовой треугольник в котором по краям стоят единицы,
а каждое число внутри равно сумме двух стоящих над ним в ближайшей строке сверху.'
        when 561
          'Дано натуральное число n. Среди чисел 1, ..., n найти все такие,
запись которых совпадает с последними цифрами записи их квадрата (как, например, 6^2 = 36, 25^2 = 625 и т. д.).'
        when 606
          'Даны действительные положительные числа a, b, c, d.
Выяснить, можно ли построить четырехугольник с такими длинами сторон.'
        when 697
          'Для матриц А и В размера k × m и m × l соответственно найти произведение АВ.'
        when 698
          'Для квадратной матрицы прядка n. Получить матрицуА^2.'
        when 699
          'Для квадратных матриц А и В порядка n. Получить матрицу АВ–ВА.'
        when 704
          'Для квадратных матриц A, B и C порядка n. Получить матрицу (A+B)C.'
        when 710
          'Для матрицы А размера m × n. Получить транспонированную матрицу А* (ее размер – m × n ).'
        when 822
          'Дан номер года. Указать число дней в этом году.'
        when 823
          'Даны натуральные числа n, m (n ≤ m ).
Определить, сколько из чисел n, n+1, ..., m являются номерами високосных годов.'
        when 831
          'День учителя ежегодно отмечается в первое воскресенье октября. Дано натуральное число n, означающее номер года.
Определить число, на которое в октябре указанного года приходится День учителя.'
        when 986
          '«Угадай число». Программа с помощью датчика случайных чисел выбирает число в диапазоне от 0 до 9.
Попробуйте угадать это числ.'
        when 988
          '«Ипподром». Играющий выбирает одну из трех лошадей, состязающихся на бегах, и выигрывает,
если его лошадь приходит первой. Скорость передвижения лошадей на разных этапах выбирается программой
с помощью датчика случайных чисел.
Введите номер лошади: 1 => Watercolor, 2 => Alpha, 3 => Gallop'
        when 1009
          '«100 спичек». Из кучки, первоначально содержащей 100 спичек, двое играющих поочередно берут
по несколько спичек: не менее одной и не более десяти. Проигрывает взявший последнюю спичку.'
        end
      end
    end
  end
end

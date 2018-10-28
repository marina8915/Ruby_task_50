require "matrix" 
require "./test.rb"
 
PI = 3.14

def task(num:)
  puts "\n Task #{num}"
end

#number=>array, example 234 => [2,3,4]
def number_array(digit:)
  return digit.to_s.split("").map{ |x| x.to_i }
end

#array of prime numbers
def array_separators(array:)
  return array.select{ |x| 
    (1..x).select{ |y| x % y == 0 }.length <= 2 
  }
end

#matrix n x m
def new_matrix(n:, m:)
  array = []
  (0..(n - 1)).each{ |i|
    array[i] = []
    (0..(m - 1)).each{
      array[i].push(rand(1..10))
    }
  }
  print array, "\n"
  return array
end

#if digit not in diapason lower_bound..top_bound enter new n
def check_digit(digit:, lower_bound: 1, top_bound: 10)
  until (lower_bound..top_bound).include? digit
    puts "incorrect value"
    puts "take again"
    digit = gets.chomp.to_i
  end
  return digit
end

#array with random digits in diapason x..y
def new_array(n:, x: -100, y: 100)
  array = []
  n.times{ array.push(rand(x..y)) }
  print "Elements: ", "#{array} \n"
  return array
end

#hint when comparing numbers
def hint(digit1:, digit2:)
  if digit1 > digit2
      "more than needed"
  elsif digit1 < digit2
      "less than needed"
  end
end

#place of the horse
def horses_num(run:, horse_num:)
  run.map!{ |x| x + rand(1..100) }
  first = run.max
  last = run.min
  text = ""
  case run[horse_num - 1]
  when first
    text =  "First"
  when last
    text =  "Last"
  else
    text =  "Second"
  end
  return {run_array: run, text: text}
end

def task_1(a:, b:)
  task(num: 1)
  return {
    sum: a + b, 
    difference: a - b, 
    multiplication: a * b
  }
end

def task_2(a:, b:)
  task(num: 2)
  ((a.abs - b.abs)/(1 + (a * b).abs)).round(4)
end

def task_3(l:)
  task(num: 3)
  return {
    V: l**3, 
    S: l**2 * 6
  }
end

def task_6(a:, b:)
  task(num: 6)
  return {
    c: Math.sqrt(a**2 + b**2).round(4),
    S: a * b/2
  }
end

def task_8(n:, r:)
  task(num: 8)
  (2 * r * Math.tan(PI/n) * n).round(4)
end

def task_9(r1:, r2:, r3:)
  task(num: 9)
  (1/(1/r1 + 1/r3 + 1/r3)).round(4)
end

def task_10(h:)
  task(num: 10)
  (Math.sqrt((2 * h)/9.81)).round(2)
end

def task_12(n:)
  task(num: 12)
  result = (Math.sqrt(3) * n)/4 * n**2
  result.round(2)
end

def task_13(l:)
  task(num: 13)
  (2 * 3.14 * Math.sqrt(l/9.81)).round(2)
end

def task_15(a:, c:)
  task(num: 15)
  b = Math.sqrt(c**2 - a**2).round(2)
  return { b: b, S: ((a + b - c)/2).round(2) }
end

def task_16(l:)
  task(num: 16)
  result = PI * Math.sqrt(l/(2 * PI))
  result.round(2)
end

def task_24(x1:, x2:, y1:, y2:)
  task(num: 24)
  result = Math.sqrt((x1 - x2)**2 + (y1 - y2)**2)
  result.round(2)
end

def task_30(x:)
  task(num: 30)
  res1 = 1 - 2 * x + 3 * x**2 - 4 * x**3
  res2 = 1 + 2 * x + 3 * x**2 + 4 * x**3
  return { result1: res1, result2: res2 }
end

def task_33(x:, y:)
  task(num: 33)
  array = [x, y]
  return { min: array.min, max: array.max }
end

def task_34(x:, y:, z:)
  task(num: 34)
  array = [x, y, z]
  return { min: array.min, max: array.max }
end

def task_41
  task(num: 41) 
  new_array(n: 3).select{ |x| x <= 3 && x >= 1 }
end

def task_43
  task(num: 43)
  array = new_array(n: 3)
  array2 = array.select{ |x| x > 0 }.map{ |x| x**2 }
  return {array: array, array2: array2}
end

def task_62(integer:)
  task(num: 62)
  integer % 2 == 0
end

def task_64(natural_number:)
  task(num: 64)
  natural_number/100
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
  return {
    digits_number: array.length,
    sum: array.reduce(:+),
    last_digit: array[array.length - 1],
    first_digit: array[0],
    penultimate_number: penultimate_number
  }
end

def task_182(natural_number:)
  task(num: 182)
  array = new_array(n: natural_number)
  array_2 = array.select{ |elem| 
    elem % 5 == 0 && elem % 7 != 0
  }
  return { arr_new: array_2, 
           sum: array_2.reduce(:+), 
           quantity: array_2.length }
end

def task_185(natural_number:)
  task(num: 185)
  array = new_array(n: natural_number)
  array_2 = array.select{ |elem| elem > 0 }
  return { array: array_2,
           sum: array_2.reduce(:+)**2 }
end

def task_191(natural_number:)
  task(num: 191)
  quantity = 0
  array = new_array(n: natural_number)
  array.map!{ |elem|
    if elem > 7
      quantity += 1 
      elem = 7
    else 
      elem
    end
  }
  return {array: array, quantity: quantity}
end

def task_205(natural_number:)
  task(num: 205)
  array = new_array(n: natural_number)
  return {
    array: array,
    max: array.map{ |x| x.abs }.max,
    sum: array.map{ |x| x*x }.reduce(:+)
  }
end

def task_207(natural_number:)
  task(num: 207)
  number_array(digit: natural_number).delete_if{ 
    |x| x == 0 || x == 5 
  }.join.to_i
end

def task_224(natural_number:)
  task(num: 224)
  (1..natural_number).select{ |x| natural_number % x == 0 }
end

def task_225(natural_number:)
  task(num: 225)
  (1..natural_number).select{ 
    |x| natural_number % x**2 == 0 &&
    natural_number % x**3 != 0 
  }
end

def task_230(natural_number:)
  task(num: 230)
  min = 1000
  num_array = new_array(n: natural_number)
  num_array.inject{ |x, y| 
    min = (x - y).abs if (x - y).abs < min
    y
  }
  return min
end

def task_272
  task(num: 272)
  precipitation = new_array(n: 50, x: 1, y: 100)
  average = precipitation.reduce(:+)/precipitation.size
  deviation = []
  precipitation.each{ |x| deviation.push(x - average) }
  return { array: precipitation, 
           average: average,
           deviation: deviation }
end

def task_279(natural_number:)
  task(num: 279)
  a = new_array(n: natural_number)
  b = new_array(n: natural_number).reverse!
  ab = []
  (0..natural_number - 1).each{ |i| ab.push(a[i] + b[i]) }
  return { array_a: a, array_b: b, array_ab: ab }
end

def task_302(natural_number:)
  task(num: 302)
  number = number_array(digit: natural_number)
  number.uniq!
  number.length
end

def task_317
  task(num: 317)
  array = new_array(n: 10)
  sum_array = 0
  (0..9).each{ |i| sum_array += array[i]**(i + 1) }
  return sum_array
end

def task_325(natural_number:)
  task(num: 325)
  separators = (1..natural_number).select{ |x|
    natural_number % x == 0 
  }
  array_separators(array: separators)
end

def task_328
  task(num: 328)
  array_separators(array: (1..100))
end

def task_536(natural_number:)
  task(num: 536)
  array = new_array(n: natural_number)
  return { array: array, 
         identical_elements: array != array.uniq }
end

def task_555(natural_number:)
  task(num: 555)
  puts "pascals triangle"
  a = []
  (0..natural_number - 1).each{ |i|
    a[i] = []
    if i == 0
      a[i] << 1
    else
      a[i] << 1 
      (0..a[i - 1].size - 2).each{ |j|
        a[i].unshift(a[i - 1][j] + a[i - 1][j + 1])
      }
      a[i].unshift(1)
    end
    print a[i], "\n"
  }
  return a
end

def task_561(natural_number:)
  task(num: 561)
  new_array = []
  (1..natural_number).each{ |s|
    array = number_array(digit: s*s)
    if array.last(number_array(digit: s).size).join.to_i == s
      new_array.push(s)
    end
  }
  return new_array
end

def task_606(a:, b:, c:, d:)
  task(num: 606)
  rectangle = [a, b, c, d]
  sum_rectangle = rectangle.reduce(:+)  
  rectangle_flag = true
  (0..3).each{ |i|
    rectangle_flag = false  if (sum_rectangle - rectangle[i]) < rectangle[i]
  }
  return  rectangle_flag 
end

def task_697(natural_number1:, natural_number2:, natural_number3:)
  task(num: 697)
  matrix_A = Matrix.rows(new_matrix(n: natural_number1, m: natural_number2))
  matrix_B = Matrix.rows(new_matrix(n: natural_number2, m: natural_number3))
  return { matrix_A: matrix_A,
           matrix_B: matrix_B,
           result: matrix_A * matrix_B }
end

def task_698(natural_number:)
  task(num: 698)
  matrix = Matrix.rows(new_matrix(n: natural_number, 
                                  m: natural_number))
  return { matrix: matrix,
           result: matrix**2 }
  
end

def task_699(natural_number:)
  task(num: 699)
  matrix_A = Matrix.rows(new_matrix(n: natural_number,
                                    m: natural_number))
  matrix_B = Matrix.rows(new_matrix(n: natural_number,
                                    m: natural_number))
  result = matrix_A * matrix_B - matrix_B * matrix_A
  return { matrix_A: matrix_A,
           matrix_B: matrix_B,
           result: result }
end

def task_704(natural_number:)
  task(num: 704)
  matrix_A = Matrix.rows(new_matrix(n: natural_number,
                                    m: natural_number))
  matrix_B = Matrix.rows(new_matrix(n: natural_number,
                                    m: natural_number))
  matrix_C = Matrix.rows(new_matrix(n: natural_number, 
                                    m: natural_number))
  return { matrix_A: matrix_A,
           matrix_B: matrix_B,
           matrix_C: matrix_C,
           result: (matrix_A + matrix_B) * matrix_C}
end

def task_710(natural_number1:, natural_number2:)
  task(num: 710)
  m = Matrix.rows(new_matrix(n: natural_number1, m: natural_number2))
  m.transpose
end

def task_822(year:)
  task(num: 822)
  year % 4 == 0 ? "366 days" : "365 days"
end

def task_823(year1:, year2:)
  task(num: 823)
  leap_years = 0
  (year1..year2).each{ |y|
    leap_years += 1 if y % 4 == 0 
  }
  return leap_years
end

def task_831(year:)
  task(num: 831)
  october = Time.mktime(year, 10, 1)
  day_1 = october.wday
  if day_1 < 7
    day = 7 - day_1
    teacher_day = Time.mktime(year, 10, day + 1)
  else 
    teacher_day = Time.mktime(year, 10, day_1)
  end
  return teacher_day
end

def task_986
  task(num: 986)
  digit = rand(0..9)
  digit_user = ""
  (1..3).each{
    puts "Guess the digit (0..9)"
    digit_user = check_digit(digit: gets.chomp.to_i, lower_bound: 0, top_bound: 9)
    break if digit_user == digit
    puts hint(digit1: digit_user, digit2: digit)
  }
  if digit_user != digit  
    puts "You did not guess #{digit}"
  else 
    puts "Right you are!"
  end
end

def task_988
  task(num: 988)
  puts horses = {
    1 => "Watercolor",
    2 => "Alpha",
    3 => "Gallop"
  }
  puts "Select horses (1..3)"
  horse_num = check_digit(digit: gets.chomp.to_i, lower_bound: 1, top_bound: 3)
  user_horse = horses[horse_num]
  puts user_horse
  finish = 500
  horses_run = []
  3.times{ horses_run.push(rand(1..100)) }
  while horses_run.max < finish
    horses_run = horses_num(run: horses_run, horse_num: horse_num)
  end
  if horses_run[horse_num - 1] >= finish
    puts "Victory!"
  else
    puts "Try again."
  end
end

def task_1009
  task(num: 1009)
  puts "Game - 100 matche s"
  puts "must take from 1 to 10 matches"
  finish = 100
  first_player = 0
  second_player = 0
  until first_player >= 100 || second_player >= 100
    puts "first player"
    first_player += check_match(gets.chomp.to_i)
    puts "second player"
    second_player += check_match(gets.chomp.to_i)
  end

  if first_player >= finish
    puts "First player is won."
  else
    puts "Second player is won."
  end
end
 
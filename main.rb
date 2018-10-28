require 'matrix' 

def task(n)
  puts "\nTask #{n}"
end

#random number in diapason n..m
def natural_number(n, m)
  num = rand(n..m)
  puts num
  return num
end

#number=>array, example 234 => [2,3,4]
def number_array(n)
  return n.to_s.split("").map{|x| x.to_i}
end

#array with random digits in diapason x..y
def new_array(n, x=-100, y=100)
  array = []
  n.times{array.push(rand(x .. y))}
  puts "Elements:"
  print "#{array}\n"
  return array
end

#array of prime numbers
def array_separators(array)
  simple_separators = array.select{|x| 
    (1..x).select{|y|
      x%y == 0
    }.length <= 2 
  }
  print "#{simple_separators}\n"
  return simple_separators
end

def get_date(y, m, d)
 return Time.mktime(y, m, d)
end

#matrix n x m
def new_matrix(n, m)
  array = []
  for p in 0..(n - 1)
    array[p] = []
    for r in 0..(m - 1)
      array[p].push(rand(1..10))
    end
  end
  print array, "\n"
  return array
end

#if n not in diapason 1..10 enter new n
def check_match(n)
  until (1..10).include?(n)
    puts "incorrect value"
    puts "take again"
    n = gets.chomp.to_i
  end
  return n
end

print "Enter the number of elements:"
n = gets.to_i

task(1)
a = rand(-100..100)
b = rand(-100..100)
puts a
puts b
puts "a + b #{a + b}"
puts "a - b #{a - b}"
puts "a * b #{a * b}"

task(2)
rez = a * b
puts (a.abs - b.abs) / (1 + (rez).abs)

task(3)
puts "V = #{n**3}"
puts "S = #{n**2 * 6}"

task(6)
a = rand(1..100)
b = rand(1..100)
puts "a = #{a}"
puts "a = #{b}"
puts "c = #{Math.sqrt(a**2 + b**2)}"
puts "S = #{(a * b) / 2}"

task(8)
r = rand(1..20)
pi = 3.14
a = 2 * r * Math.tan(pi / n)
puts "P = #{r * n}"

task(9)
r1 = rand(1.0..20.0)
r2 = rand(1.0..20.0)
r3 = rand(1.0..20.0)
R = 1/r1 + 1/r3 + 1/r3
puts "R = #{1 / R}"

task(10)
rez = Math.sqrt((2 * n)/9.81)
puts rez

task(12)
s = (Math.sqrt(3) * n)/4 * n**2
puts "S = #{s}"

task(13)
t = 2 * 3.14 * Math.sqrt(n / 9.81)
puts "t = #{t}"

task(15)
a = rand(1.0..100.0)
c = rand(1.0..100.0)
puts "a = #{a}"
puts "с = #{c}"
b = Math.sqrt(c**2 - a**2)
puts "b = #{b}"
puts "S = #{(a + b - c) / 2}"

task(16)
l = rand(1..100)
r = l / (2 * pi)
puts pi * Math.sqrt(r)

task(24)
x1 = rand(1..100)
x2 = rand(1..100)
y1 = rand(1..100)
y2 = rand(1..100)
puts Math.sqrt((x1-x2)**2+(y1-y2)**2)

task(30)
puts 1 - 2 * n + 3 * n**2 - 4 * n**3
puts 1 + 2 * n + 3 * n**2 + 4 * n**3

task(33)
array = new_array(2)
puts "min #{array.min}"
puts "max #{array.max}"

task(34)
array = new_array(3)
puts "min #{array.min}"
puts "max #{array.max}"

task(41)
print new_array(3).select{|x| x <= 3 && x >= 1}, "\n"

task(43)
print new_array(3).select{|x| x > 0}.map{|x| x**2}, "\n"

task(62)
puts n%2 == 0 ? "yes" :"no"

task(64)
num = natural_number(99, 1000)
hundreds = num / 100
puts "Hundreds #{hundreds.to_i}"

task(65)
num = natural_number(99, 1000)
num_array = number_array(num)
sum_array = num_array.reduce(:+)
puts sum_array**3 == num**2 ? "yes" : "no"

task(67)
num = natural_number(1, 100)
num_array = number_array(num)
puts "Digits number #{num_array.length}"
puts "Sum #{num_array.reduce(:+)}"
puts "last digit #{num_array[num_array.length - 1]}"
puts "first digit #{num_array[0]}"
puts "last digit #{num_array[num_array.length - 1]}" if num >= 10 

task(182)
sum = 0
quantity = 0
array = new_array(n)
array.each{|elem|
  if elem%5 == 0
    if elem%7 != 0
      sum += elem
      quantity += 1
    end
  end
}
puts "Sum #{sum}"
puts "Quantity #{quantity}"

task(185)
sum = 0
array = new_array(n)
array.each{|elem|
  if elem > 0
      sum += elem
  end
}
sum = sum * 2
puts "Sum #{sum}"

task(191)
b = []
quantity = 0
a = new_array(n)
a.map{|elem|
  elem.downto(7){
    quantity += 1 if elem > 7
    elem = 7
  }
  b.push(elem)
}
print "#{b}\n"
puts "Quantity #{quantity}"

task(205)
puts a.map{|x| x.abs}.max
puts a.map{|x| x*x}.reduce(:+)

task(207)
num = natural_number(1, 100)
num_array = number_array(num).delete_if{|x| x == 0 || x == 5}
print "#{num_array}\n"

task(224)
print (1..n).select{|x| n%x == 0}, "\n"

task(225)
print (1..n).select{|x| n%x**2 == 0 && n%x**3 != 0}, "\n"

task(230)
min = 1000
num_array = new_array(n).map{|x| x.abs}
num_array.inject{|x, y|
  if (x - y).abs < min
    min = (x - y).abs
  end
y}
puts "min #{min}"

task(272)
precipitation = new_array(50, 1, 100)
average = precipitation.reduce(:+) / precipitation.size
puts "average #{average}"
deviation = []
precipitation.each{|x| deviation.push(x - average)}
puts "deviation #{deviation}"

task(279)
a = new_array(n)
b = new_array(n).reverse!
ab = []
i = 0
while i < n do
  ab.push(a[i] + b[i])
  i += 1
end
print "#{ab}\n"

task(302)
puts n
number = number_array(n)
number.uniq!
puts "quantity of unique digits #{number.length}"

task(317)
array = new_array(10, 1, 100)
i = 0
sum_array = 0
while i < 10 do
  sum_array += array[i]**(i + 1)
  i += 1
end
puts "Result #{sum_array}"

task(325)
separators = (1..n).select{|x| n%x == 0}
simple_separators = array_separators(separators)

task(328)
array_separators((1..100))

task(536)
number1 = new_array(n)
puts number1 != number1.uniq ? "yes" : "no"

task(555)
puts "pascals triangle"
for i in 1..n
  a[i] = []
  case i
    when 1
      a[i] << 1
    when 2
      a[i] << 1  
      a[i].unshift(1)   
    else
      k = 0
      a[i] << 1 
      while k < (a[i - 1].size - 1) do
        a[i].unshift(a[i - 1][k] + a[i - 1][k + 1])
        k += 1
      end
      a[i].unshift(1)
  end
  print "#{a[i]}\n"
end

task(561)
new_array = []
for s in 1..n
  array = number_array(s*s)
  if array.last == s 
    new_array.push(s)
  end
  if s > 9
    if array.last(number_array(s).size).join.to_i == s
      new_array.push(s)
    end
  end
end
print "#{new_array}\n"

task(606)
rectangle = new_array(4, 1, 100)
sum_rectangle = rectangle.reduce(:+)
for i in 0..3
  break if (sum_rectangle - rectangle[i]) < rectangle[i]
end
puts i < 3 ? "no" : "yes"

task(697)
print "l ="
l = gets.to_i
print "k ="
k = gets.to_i
matrix_A = Matrix.rows(new_matrix(k, n))
matrix_B = Matrix.rows(new_matrix(n, l))
print matrix_A * matrix_B, "\n"

task(698)
matrix = Matrix.rows(new_matrix(n, n))
print matrix, "\n"
print matrix**2, "\n"

task(699)
matrix_A = Matrix.rows(new_matrix(n, n))
matrix_B = Matrix.rows(new_matrix(n, n))
print matrix_A * matrix_B - matrix_B * matrix_A, "\n"

task(704)
matrix_A = Matrix.rows(new_matrix(n, n))
matrix_B = Matrix.rows(new_matrix(n, n))
matrix_C = Matrix.rows(new_matrix(n, n))
print (matrix_A + matrix_B) * matrix_C, "\n"

task(710)
m = Matrix.rows(new_matrix(k, n))
print m.transpose, "\n"

task(822)
year = natural_number(1, 2018)
puts year%4 == 0 ? "366 days" : "365 days"

task(823)
year_1 = natural_number(1, 1000)
year_2 = natural_number(1000, 2018)
leap_years = 0
for y in year_1..year_2
 if y%4 == 0 
   leap_years += 1
  end
end
puts "leap years #{leap_years}"

task(831)
october = get_date(year, 10, 1)
day_1 = october.wday
if day_1 < 7
  day = 7 - day_1
  teacher_day = get_date(year, 10, day + 1)
else 
  teacher_day = get_date(year, 10, day_1)
end
puts "teacher's Day #{teacher_day}"

task(986)
digit = rand(0..9)
for i in 1..3
  puts "Guess the digit (0..9)"
  digit_user = gets.chomp.to_i
  break if digit_user == digit
  if digit_user > digit
    puts "more than needed"
  elsif digit_user < digit
   puts "less than needed"
  end
end
if digit_user != digit && i == 3 
  puts "You did not guess #{digit}"
else 
  puts "Right you are!"
end

task(988)
horses = {
  1 =>"Watercolor",
  2 => "Alpha",
  3 => "Gallop"}
puts horses
puts "Select horses (1..3)"
horse_num = gets.chomp.to_i
user_horse = horses[horse_num]
puts user_horse
finish = 500
hourses_run = []
3.times{hourses_run.push(rand(1 .. 100))}
print hourses_run, "\n"

while hourses_run.max < finish
  hourses_run.map!{|x| x + rand(1 .. 100)}
  print hourses_run, "\n"
  first = hourses_run.max
  last = hourses_run.min
  case
    when hourses_run[horse_num - 1] == first
      puts "Your horse first."
    when hourses_run[horse_num - 1] == last
      puts "Your horse last."
    else
      puts "Your horse is second."
  end
end
  case
    when hourses_run[horse_num - 1] >= finish
      puts "Your horse won."
    else
      puts "Your horse not won."
  end

task(1009)
puts "Game - 100 matches"
puts "must take from 1 to 10 matches"
finish = 100
first_player = 0
second_player = 0
until first_player >= 100 || second_player >= 100
  puts "first_player"
  first_player += check_match(gets.chomp.to_i)
  puts "second_player"
  second_player += check_match(gets.chomp.to_i)
end

if first_player >= finish
    puts "first player won."
else
    puts "second player won."
end

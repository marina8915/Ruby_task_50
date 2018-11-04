$LOAD_PATH.unshift('.')

require 'matrix'
require 'tests'
require 'tasks'

puts Tasks::Task.new.task(num: 2)
print Tasks::Task.new.number_array(digit: 2356), "\n"
print Tasks::Task.new.task_1(number_a: 2, number_b: 5), "\n"
print Tasks::Task.instance_methods(false), "\n"

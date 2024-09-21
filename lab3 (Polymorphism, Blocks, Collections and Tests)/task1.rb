puts "Выберите номер задачи, которую будем решать"
puts "Задача 1: Дан целочисленный массив. Необходимо найти количество элементов, расположенных после последнего максимального."
puts "Задача 2: Дан целочисленный массив. Необходимо разместить элементы, расположенные до минимального, в конце массива."
puts "Задача 3: Дан целочисленный массив и интервал a..b. Необходимо найти максимальный из элементов в этом интервале."
puts "Задача 4: Дан целочисленный массив. Вывести индексы элементов, которые меньше своего левого соседа, и количество таких чисел."
puts "Задача 5: Для введенного списка положительных чисел построить список всех положительных простых делителей элементов списка без повторений."

puts "Выберите как вводим массив"
puts "1. Через консоль"
puts "2. Через файл"

def read_from_file(name_file)
  array=[]
  File.open(name_file, 'r') do |file|
    file.each_line {|x| array.push(x.to_i)}
  end
  return array
end

def count_element_after_max(array)
  Rspec
end

def element_before_min(array)
  Rspec
end

def max_element_in_the_interval(array)
  Rspec
end

def index_and_count_element_less_left(array)
  Rspec
end

def positive_simple_dividers(array)
  Rspec
end


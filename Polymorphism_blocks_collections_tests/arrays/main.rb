def read_from_file(file)
  begin
    File.open(file, 'r') do |f|
      f.flat_map { |line| line.split.map{|x| x.to_i } }
    end
  rescue
    puts "Такого адреса файла не существует"
    exit -1
  end
end

def read_from_input 
  puts "Введите элементы массива:"
  input = gets.chomp 
  input.split.map(&:to_i)
end

puts "Выберите задачу для решения:"
puts "1 - Дан целочисленный массив. Необходимо найти количество элементов, расположенных после последнего максимального."
puts "2 - Дан целочисленный массив. Необходимо разместить элементы, расположенные до минимального, в конце массива."
puts "3 - Дан целочисленный массив и интервал a..b. Необходимо найти максимальный из элементов в этом интервале."
puts "4 - Дан целочисленный массив. Вывести индексы элементов, которые меньше своего левого соседа, и количество таких чисел."
puts "5 - Для введенного списка положительных чисел построить список всех положительных  простых делителей элементов списка без повторений."

task_choice = gets.chomp.to_i

puts "Способ ввода: 1 - с клавиатуры, 2 - из файла"
choice = gets.chomp.to_i

if choice == 1 
  array = read_from_input
elsif choice == 2 
  puts "Введите путь к файлу:"
  file = gets.chomp
  array = read_from_file(file)
else puts "Неверный выбор"
  exit
end

def count_elements_after_max(array)
  max_element = array.max
  index_last_max_element = array.rindex(max_element)
  array_slice = array.slice(index_last_max_element + 1, array.length).length
  return array_slice
end

def elements_after_min(array)
  min_element = array.min
  index_min_element = array.index(min_element)
  array_slice = array.slice(index_min_element, array.length) + array.slice(0, index_min_element) 
  return array_slice
end

def max_element_on_the_interval(array,a,b)
  return array[a..b].max
end

def element_less_left(array)
  indices = (1...array.length).select do |i|
    array[i] < array[i-1]
  end
  count_indices = indices.length
  return indices, count_indices
end

def prime_factors(n)
  return [] if n < 2
  factors = []
  (2..Math.sqrt(n)).each do |i|
    while n % i == 0
      factors << i unless factors.include?(i)
      n /= i
    end
  end
  factors << n if n > 1
  factors
end

def list_divisors_without_repetitions(array)
  list_divisors = array.flat_map {|item| prime_factors(item)}.uniq
  return list_divisors
end

case task_choice
when 1
  puts count_elements_after_max(array)
when 2 
  puts "Исходный массив: #{array}"
  new_array = elements_after_min(array)
  puts "Преобразованный массив: #{new_array}"
when 3 
  puts max_element_on_the_interval(array, 1, 5)
when 4 
  puts element_less_left(array)
when 5 
  print list_divisors_without_repetitions(array)
else puts "Неверный выбор задачи"
end
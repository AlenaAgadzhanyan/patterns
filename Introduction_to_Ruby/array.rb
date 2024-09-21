# Написать методы, которые находят минимальный, элементы, номер первого положительного элемента. Каждая 
# операция в отдельном методе. Решить задачу с помощью циклов(for и while).

def minimum(array)
  if array.count{|item| !item.nil?} != 0 then
    min = array[0]
  else return nil
  end
  for index in 1...array.length do
    if array[index] != nil && array[index] < min then
      min = array[index]
    end
  end
  return min
end


def index_first_positive_element(array)
  if array.count{|item| !item.nil?} == 0 then
    return nil
  end
  for index in 0...array.length do
    if array[index] != nil && array[index] > 0 then
      return index
    end
  end
  return nil
end

# Написать программу, которая принимает как аргумент два значения. Первое значение говорит, какой из методов задачи 
# 1 выполнить, второй говорит о том, откуда читать список аргументом должен быть написан адрес файла. Далее 
# необходимо прочитать массив и выполнить метод.

def read_from_file(name_file)
  array=[]
  File.open(name_file, 'r') do |file|
    file.each_line {|x| array.push(x.to_i)}
  end
  return array
end

if ARGV.length == 2 then
  number_method = ARGV[0].to_i
  name_file = ARGV[1]
  array = read_from_file(name_file)
  case number_method
  when 1
    puts "#{minimum(array)}"
  when 2
    puts "#{index_first_positive_element(array)}"
  else
    puts "Нет метода с таким номером"
  end
else puts "Введите 2 аргумента"
end

# Написать методы, которые находят минимальный, элементы, номер первого положительного элемента. Каждая 
# операция в отдельном методе. Решить задачу с помощью циклов(for и while).

def minimum(array)
  if array.count{|item| !item.nil?} != 0 then
    min = array[0]
  else return "The array doesn't contain not-zero elements"
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
    return "The array doesn't contain not-zero elements"
  end
  for index in 0...array.length do
    if array[index] != nil && array[index] > 0 then
      return index
    end
  end
  return nil
end

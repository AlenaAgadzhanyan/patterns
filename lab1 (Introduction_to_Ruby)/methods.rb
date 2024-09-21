# Найти сумму простых делителей числа

def simple_divider(number)
  sum = 0
	for divider in 2..number do
    if number % divider == 0 then
      flag = true
      for i in 2...divider do
        if divider % i == 0 then
          flag = false
        end
      end
      if flag == true then
        sum += divider
      end
    end
  end
  return sum
end

puts "Сумма простых делителей введённого числа равна #{simple_divider(35)}"

# Найти количество нечетных цифр числа, больших 3.
def count_odd_number(number)
  count = 0
  while (number > 0)
    if number % 10 > 3 && number % 10 % 2 != 0 then
      count += 1
    end
    number /= 10
  end
  return count
end

puts "Количество нечетных цифр числа, больших 3: #{count_odd_number(123352)}"

# Найти произведение таких делителей числа, сумма цифр которых меньше, чем сумма цифр исходного числа.

def sum_of_digits(current_number)
  number = current_number
  sum = 0

  while (current_number > 0)
    sum += current_number % 10
    current_number /= 10
  end

  multiplication_divider = 1

  for divider in 2..number do

    clone_divider = divider
    
    if number % divider == 0 then
      sum_divider = 0
      while (divider > 0)
        sum_divider += divider % 10
        divider /= 10
      end
      
      if sum_divider < sum then
        multiplication_divider *= clone_divider
        
      end
    end
  end
  return multiplication_divider
end

puts "Произведение делителей числа, сумма цифр которых меньше, чем сумма цифр исходного числа равно #{sum_of_digits(124)}"
# Найти сумму простых делителей числа

def simple_divider(n)
	for divider in 2...n do
		if n % divider == 0 then
			return false
		end
	end
	return true
end

print "Введите число: "
number = gets.to_i.abs
sum = 0
for divider in 2..number do
	if number % divider  ==0 and simple_divider(divider)  == true then
		sum += divider
	end
end
print "Сумма простых делителей введённого числа равна #{sum}"

# Найти количество нечетных цифр числа, больших 3.

print "Введите число: "
number = gets.to_i.abs
count = 0
while (number > 0)
  if number % 10 > 3 and number % 10 % 2 != 0 then
    count += 1
  end
  number /= 10
end
print "Количество нечетных цифр числа, больших 3: #{count}"

# Найти произведение таких делителей числа, сумма цифр которых меньше, чем сумма цифр исходного числа.

def sum_of_digits(current_number)
  sum = 0
  while (current_number > 0)
    sum += current_number % 10
    current_number /= 10
  end
  return sum
end

print "Введите число: "
number = gets.to_i.abs
sum_number = sum_of_digits(number)
multiplication_divider = 1
for divider in 2..number do
  if number % divider == 0 and sum_of_digits(divider) < sum_number then
    multiplication_divider *= divider
  end
end
print "Произведение делителей числа, сумма цифр 
которых меньше, чем сумма цифр исходного числа равно #{multiplication_divider}"
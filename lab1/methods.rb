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


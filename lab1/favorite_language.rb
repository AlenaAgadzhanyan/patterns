name = ARGV[0]
puts "Hello, #{name}. What's your favorite programming language? "
language = STDIN.gets.chomp.downcase
case language
when "ruby"
	puts "Да вы подлиза, мистер"
when "pascal"
	puts "Все мы когда-то с этого начинали, но скоро это будет ruby"
when "python"
	puts "Это тоже пригодится, но ты полюбишь ruby"
else
	puts "Не знаю такой. Зато знаю ruby"
end
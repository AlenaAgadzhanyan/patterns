class Student

  attr_accessor :surname, :firstname, :lastname, :id, :phone_number, :telegram, :email, :git
  
  def initialize(parameters)
    @id = parameters[:id]
    @surname = parameters[:surname]
    @firstname = parameters[:firstname] 
    @lastname = parameters[:lastname]
    @phone_number = parameters[:phone_number]
    @telegram = parameters[:telegram]
    @email = parameters[:email]
    @git = parameters[:git]

    raise "Please enter your surname, firstname, lastname" if @surname.nil? || @lastname.nil? || @firstname.nil?
  end

  def information()
    puts
    puts "ID: #{@id}"
    puts "Surname: #{@surname}"
    puts "Firstname: #{@firstname}"
    puts "Lastname: #{@lastname}"
    puts "Phone_number: #{@phone_number}"
    puts "Telegram: #{@telegram}"
    puts "Email: #{@email}"
    puts "Git: #{@git}"
  end

end

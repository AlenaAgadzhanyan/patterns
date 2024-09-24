class Student

  attr_accessor :surname, :firstname, :lastname, :id, :telegram, :email, :git
  attr_reader :phone_number

  def initialize(parameters)
    @id = parameters[:id]
    @surname = parameters[:surname]
    @firstname = parameters[:firstname] 
    @lastname = parameters[:lastname]
    self.phone_number = parameters[:phone_number]
    @telegram = parameters[:telegram]
    @email = parameters[:email]
    @git = parameters[:git]

    raise "Please enter your surname, firstname, lastname" if @surname.nil? || @lastname.nil? || @firstname.nil?
  end

  def self.phone_number_regex?(phone_number_value)
    phone_number_value.match(/\A(\+?7|8)\d{10}\z/)
  end

  def phone_number=(phone_number_value)
    if !self.class.phone_number_regex?(phone_number_value) then
      raise "Incorrect phone number"
    end
    @phone_number = phone_number_value
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

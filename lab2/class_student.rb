class Student

  attr_accessor :surname, :firstname, :lastname, :id, :phone_number, :telegram, :email, :git
  
  def initialize(surname, firstname, lastname, id = nil, phone_number = nil, telegram = nil, email = nil, git = nil)
    @id = id
    @surname = surname
    @firstname = firstname
    @lastname = lastname
    @phone_number = phone_number
    @telegram = telegram
    @email = email
    @git = git
  end

  def information()
    puts "id: #{@id}, surname: #{@surname}, firstname: #{@firstname}, lastname: #{@lastname}, phone_number: #{@phone_number}, telegram: #{@telegram}, email: #{@email}, git: #{@git}"
  end

end

class Student
  attr_accessor :id
  attr_reader :phone_number, :telegram, :email, :git, :surname, :firstname, :lastname

  def initialize(parameters)
    @id = parameters[:id]
    self.surname = parameters[:surname]
    self.firstname = parameters[:firstname] 
    self.lastname = parameters[:lastname]
    self.phone_number = parameters[:phone_number]
    self.telegram = parameters[:telegram]
    self.email = parameters[:email]
    self.git = parameters[:git]
  end

  def self.phone_number_regex?(phone_number_value)
    phone_number_value.nil? || phone_number_value.match?(/\A(\+?7|8)\d{10}\z/)
  end

  def phone_number=(phone_number_value)
    if !Student.phone_number_regex?(phone_number_value) then
      raise "Incorrect phone number"
    end
    @phone_number = phone_number_value
  end

  def self.surname_firstname_lastname_regex?(surname_firstname_lastname_value)
    surname_firstname_lastname_value.match?(/^[А-ЯЁа-яё]+$/)
  end

  def surname=(surname_value)
    if surname_value.nil? then raise "The fields of the surname, firstname, lastname must be filled in"
    elsif !Student.surname_firstname_lastname_regex?(surname_value) then
      raise "Incorrect surname"
    end
    @surname = surname_value[0].upcase + surname_value.slice(1, surname_value.length - 1)
  end

  def firstname=(firstname_value)
    if firstname_value.nil? then raise "The fields of the surname, firstname, lastname must be filled in"
    elsif !Student.surname_firstname_lastname_regex?(firstname_value) then
      raise "Incorrect firstname"
    end
    @firstname = firstname_value[0].upcase + firstname_value.slice(1, firstname_value.length - 1)
  end

  def lastname=(lastname_value)
    if lastname_value.nil? then raise "The fields of the surname, firstname, lastname must be filled in"
    elsif !Student.surname_firstname_lastname_regex?(lastname_value) then
      raise "Incorrect lastname"
    end
    @lastname = lastname_value[0].upcase + lastname_value.slice(1, lastname_value.length - 1)
  end

  def self.telegram_regex?(telegram_value)
    telegram_value.nil? || telegram_value.match?(/\A@[a-zA-Z0-9_]{5,32}\z/)
  end

  def telegram=(telegram_value)
    if !self.class.telegram_regex?(telegram_value) then
      raise "Incorrect telegram"
    end
    @telegram = telegram_value
  end

  def self.email_regex?(email_value)
    email_value.nil? || email_value.match?(/\A[a-zA-Z0-9_.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+\z/)
  end

  def email=(email_value)
    if !self.class.email_regex?(email_value) then
      raise "Incorrect email"
    end
    @email = email_value
  end

  def self.git_regex?(git_value)
    git_value.nil? || git_value.match?(/\A(https:\/\/)?github.com\/[a-zA-Z0-9_-]+\z/)
  end

  def git=(git_value)
    if !self.class.git_regex?(git_value) then
      raise "Incorrect git"
    end
    @git = git_value
  end

  def validate?
    return Student.git_regex(@git) && (Student.email_regex(@email) || Student.phone_number_regex(@phone_number) || Student.telegram_regex(@telegram))
  end

  def to_s()
    puts
    puts "ID: #{@id}"
    puts "Surname: #{@surname}"
    puts "Firstname: #{@firstname}"
    puts "Lastname: #{@lastname}"
    puts "Phone_number: #{@phone_number}" if @phone_number
    puts "Telegram: #{@telegram}" if @telegram
    puts "Email: #{@email}" if @email
    puts "Git: #{@git}" if @git
  end

end

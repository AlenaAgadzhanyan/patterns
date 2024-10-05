class Student < Person
  attr_reader :id, :phone_number, :telegram, :email, :git, :surname, :firstname, :lastname

  def initialize(surname:, firstname:, lastname:, id: nil, phone_number: nil, telegram: nil, email: nil, git: nil)
    super(id)
    self.surname = surname
    self.firstname = firstname
    self.lastname = lastname
    set_contacts(phone_number: phone_number, telegram: telegram, email: email)
    self.git = git
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

  def git=(git_value)
    if !self.class.git_regex?(git_value) then
      raise "Incorrect git"
    end
    @git = git_value
  end

  def set_contacts(phone_number: nil, telegram: nil, email: nil)
    @phone_number = phone_number if Student.phone_number_regex?(phone_number)
    @email = email if Student.email_regex?(email)
    @telegram = telegram if Student.telegram_regex?(telegram)
  end

  def to_s()
    puts "\nID: #{@id} \nSurname: #{@surname} \nFirstname: #{@firstname} \nLastname: #{@lastname} #{"\nPhone_number: #{@phone_number}" if @phone_number} #{"\nTelegram: #{@telegram}" if @telegram} #{"\nEmail: #{@email}" if @email} #{"\nGit: #{@git}" if @git}"
  end

  def get_contact()
    if @phone_number then
      "phone_number: #{@phone_number}"
    elsif @telegram then
      "telegram: #{@telegram}"
    elsif @email then
      "email: #{@email}"
    end
  end

  def get_name()
    "ФИО: #{self.surname} #{self.firstname[0]}.#{self.lastname[0]}."
  end

  def getInfo()
    "\n#{get_name}, git: #{self.git}, #{get_contact}"
  end

end

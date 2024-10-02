class Student
  attr_accessor :id
  attr_reader :phone_number, :telegram, :email, :git, :surname, :firstname, :lastname

  def initialize(surname:, firstname:, lastname:, id:, phone_number: nil, telegram: nil, email: nil, git: nil)
    @id = id
    self.surname = surname
    self.firstname = firstname
    self.lastname = lastname
    set_contacts(phone_number: phone_number, telegram: telegram, email: email)
    self.git = git
  end

  def self.phone_number_regex?(phone_number_value)
    phone_number_value.nil? || phone_number_value.match?(/\A(\+?7|8)\d{10}\z/)
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

  def self.email_regex?(email_value)
    email_value.nil? || email_value.match?(/\A[a-zA-Z0-9_.+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-.]+\z/)
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
    return @git && (@email || @phone_number || @telegram)
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

class Student_short
  attr_reader :id, :data, :student

  def initialize(id:, data: nil, student: nil)
    if (student)
      @id = student.id
      @fio = student.surname + student.firstname[0] + "." + student.lastname[0] + "."
      @git = student.git
      @contact = student.phone_number || student.telegram || student.email 
    else
      @id = id
      from_string(data)
    end
  end

  def from_string(data)
    fio = ""
    git = ""
    contact = ""

    data.split(",").map do |field|

      pair = field.split(":")
      
      if pair.length != 2
        raise "Invalid data format"
      end
      
      case pair[0].strip
      when "fio", "ФИО"
        fio = pair[1].strip
      when "git"
        git = pair[1].strip
      when "contact", "phone_number", "telegram", "email"
        contact = pair[1].strip
      else
        raise "Invalid data format"
      end
    end
  end
  
end
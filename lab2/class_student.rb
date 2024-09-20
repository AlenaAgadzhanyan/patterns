class Student

  # Конструктор
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

  # Геттеры
  def id
    @id
  end

  def surname
    @surname
  end

  def firstname
    @firstname
  end

  def lastname
    @lastname
  end

  def phone_number
    @phone_number
  end

  def telegram
    @telegram
  end

  def email
    @email
  end

  def git
    @git
  end

  # Сеттеры
  def id=(id_value)
    @id = id_value
  end

  def surname=(surname_value)
    @surname = surname_value
  end

  def firstname=(firstname_value)
    @firstname = firstname_value
  end

  def lastname=(lastname_value)
    @lastname = lastname_value
  end

  def phone_number=(phone_number_value)
    @phone_number = phone_number_value
  end

  def telegram=(telegram_value)
    @telegram = telegram_value
  end

  def email=(email_value)
    @email = email_value
  end

  def git=(git_value)
    @git = git_value
  end

  def information()
    puts "id: #{@id}, surname: #{@surname}, firstname: #{@firstname}, lastname: #{@lastname}, phone_number: #{@phone_number}, telegram: #{@telegram}, email: #{@email}, git: #{@git}"
  end
  
end

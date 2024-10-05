class Person

  def initialize(id: nil)
    @id = id
  end

  def self.phone_number_regex?(phone_number_value)
    phone_number_value.nil? || phone_number_value.match?(/\A(\+?7|8)\d{10}\z/)
  end

  def self.surname_firstname_lastname_regex?(surname_firstname_lastname_value)
    surname_firstname_lastname_value.match?(/^[А-ЯЁа-яё]+$/)
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

  def has_git?()
    !@git.nil?
  end

  def has_contact?()
    !@email.nil || !@phone_number.nil? || !@telegram.nil?
  end

  def validate?
    has_git?() && has_contact?()
  end

end


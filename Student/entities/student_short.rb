require_relative './person.rb'

class Student_short < Person
  attr_reader :fio, :contact

  def initialize(id: nil, fio: nil, git: nil, contact: nil)
    super(id: id, git: git)
    @fio = fio
    @contact = contact
  end

  def self.from_student(student)
    new(id: student.id, fio: student.surname + " " + student.firstname[0] + "." + student.lastname[0] + ".", git: student.git(), contact: student.contact())
  end

  def self.from_string(id, data)
    fio = ""
    git = ""
    contact = ""
  
    data.split(",").each do |field|
  
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
    new(id: id, fio: fio, git: git, contact: contact)
  end
end
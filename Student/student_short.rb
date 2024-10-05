class Student_short < Person
  attr_reader :id, :data, :student

  def initialize(id: nil, data: nil, student: nil)
    super(id)
    if (student)
      @fio = student.surname + student.firstname[0] + "." + student.lastname[0] + "."
      @git = student.git
      @contact = student.phone_number || student.telegram || student.email 
    else
      from_string(data)
    end
  end

  def self.from_string(data)
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
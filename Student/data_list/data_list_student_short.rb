require './data_list.rb'
require '../data_table/data_table.rb'

class DataListStudentShort < DataList
  def get_names
    ["fio", "contact", "git"]
  end

  def get_data
    data_for_table = @data.map.with_index do |student, index|
      [index + 1, student.fio, student.contact, student.git]
    end
    DataTable.new(data_for_table) 
  end

end
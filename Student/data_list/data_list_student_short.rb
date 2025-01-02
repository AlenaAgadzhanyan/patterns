require './data_list.rb'
require '../data_table/data_table.rb'

class DataListStudentShort < DataList

  def initialize(data)
    super(data)
  end

  def get_names
    ["fio", "contact", "git"]
  end

  def row_data(index)
    [index + 1, @data[index].fio, @data[index].contact, @data[index].git] 
  end

end
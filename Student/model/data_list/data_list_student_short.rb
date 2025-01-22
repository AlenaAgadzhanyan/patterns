require_relative './data_list.rb'
require_relative '../data_table/data_table.rb'

class DataListStudentShort < DataList
  def base_names
    ["Fio", "Git", "Contacts"]
  end

  def data_row(item, index)
    [index + 1, item.fio, item.git, item.contact,]
  end
end
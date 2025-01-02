require '../deep_copy/deep_copy.rb'

class DataTable
  include Deep_dup
  
  def row_count()
    @data.size
  end

  def column_count()
    @data.first.size
  end

  def get_element(row, column)
    raise IndexError, "Incorrect index" unless valid_indices?(row, column)
    deep_copy(@data[row][column])
  end

  private

  attr_reader :data

  def initialize(data)
    @data = data
  end

  def data=(data)
    raise ArgumentError, "Incorrect data" unless valid_data?(data)
    @data = data.map{|row| row.dup}
  end

  def valid_data?(data)
    data.is_a(Array) && data.all? {|row| row.is_a(Array)} 
  end

  def valid_indices?(row, column)
    row.between?(0, row_count - 1) && column.between?(0, column_count - 1)
  end

end

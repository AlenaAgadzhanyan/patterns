class DataList
  def initialize(data)
    @data = data.freeze
    @selected = []
  end

  def select(number)
    item = data[number]
    @selected << item unless @selected.include?(item)
  end

  def get_selected()
    @selected.dup
  end

  def get_names()
    raise ArgumentError, "The method is not implemented"
  end

  def row_data()
    raise ArgumentError, "The method is not implemented"
  end

  def get_data()
    data_for_table = @data.map.with_index do |student, index|
      self.row_data(index)
    end
    DataTable.new(data_for_table)
  end

  protected

  attr_reader :data
  attr_accessor :selected

  def data=(data)
    @data = data.map{|row| deep_copy(row)}
  end

  def deep_copy(obj)
    if obj.is_a?(Array)
      obj.map { |item| deep_copy(item) }
    elsif obj.is_a?(Hash)
      obj.transform_values { |value| deep_dup(value) }
    elsif obj.respond_to?(:dup)
      obj.dup
    else
      obj
    end
  end

end
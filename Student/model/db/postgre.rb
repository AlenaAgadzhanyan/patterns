require 'pg'
class PGClient
  
  def exec(query)
    client.exec(query)
  end

  def exec_params(query)
    client.exec_params(query)
  end

  def close
    client.close
  end
  
  def self.instance
    @instance ||= new
  end

  private
  attr_accessor :client
  private_class_method :new

  @instance = nil

  def initialize
    self.client = PG.connect(
      dbname: 'Students',
      user: 'postgres',
      password: '123',
      host: 'localhost',
      port: 5432
    )
  end
end
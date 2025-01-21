require 'pg'
class PG_client
  def initialize
    self.client = PG.connect(
      dbname: 'Students',
      user: 'postgres',
      password: '123',
      host: 'localhost',
      port: 5432
    )
  end

  def exec(query)
    client.exec(query)
  end

  def exec_params(query)
    client.exec_params(query)
  end
  
  private
  attr_accessor :client
end
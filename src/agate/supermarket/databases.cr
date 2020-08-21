require "sqlite3"

class Database
  @table_name : String
  @stock_name : String
  @category : String
  @ndb_path : String

  def initialize
    @table_name = "items"
    @stock_name = "stocks"
    @category = "category"
    @ndb_path = "sqlite3://./bin/database.db"
  end

  def create_database
    DB.open @ndb_path.to_s do |db|
      db.exec "create table supermarket (#{@table_name} text, #{@stock_name} integer, #{@category} text)"
    end
  end

  def insert(args, category)
    begin
      DB.open @ndb_path.to_s do |db|
        if (typeof(args) == typeof(Hash(String, Int32).new))
          args.each do |key, value|
            db.exec "insert into supermarket values (?, ?, ?)", "#{key.to_s}", value.to_i, "#{category}"
          end
        else
          raise "Error when inserting data to database"
        end
      end
    rescue ex
      puts ex
    end
  end

end

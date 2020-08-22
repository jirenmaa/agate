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

    creating = true
    begin
      unless creating
        DB.open @ndb_path.to_s do |db|
          db.exec "create table supermarket (#{@table_name} text, #{@stock_name} integer, #{@category} text)"
        end
      else
        raise "Database has been created in : \"./bin/database.db\""
      end
    rescue ex
      puts ex.message
    end
  end

  def query(query)
    DB.open @ndb_path.to_s do |db|
      db.query_each query do |rs|
        puts "item: #{rs.read}, stock: #{rs.read}"
      end
    end
  end

  def action(action, table, where)
    DB.open @ndb_path.to_s do |db|
      if (where.size === 3)
        operators = [">", ">=", "=", "<=", "<"]
        field     = where[0]
        operator  = where[1]
        value     = where[2]

        if (operators.includes? operator.to_s)
          sql = "#{action} from #{table} where #{field} #{operator} \"#{value.to_s}\""
          query(sql)
        end
      end
    end
  end

  def insert(args, category)
    begin
      DB.open @ndb_path.to_s do |db|
        if (args.is_a?(Hash(String, Int32)))
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

  def delete(args)
  end
end

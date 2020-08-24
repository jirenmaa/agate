require "sqlite3"

class Database
  @table_name : String
  @stock_name : String
  @category : String
  @ndb_path : String
  @db : Nil

  def initialize
    @table_name = "items"
    @stock_name = "stocks"
    @category = "category"
    @ndb_path = "sqlite3://./bin/database.db"
  end

  def query(q)
    result = Array(Hash(String, String)).new
    payload = Hash(String, String).new

    DB.open @ndb_path.to_s do |db|
      db.query_each q do |rs|
        payload.merge!({
          "item"     => rs.read.to_s,
          "stock"    => rs.read.to_s,
          "category" => rs.read.to_s,
        })

        result << payload
      end
    end

    return result
  end

  def action(action, table, where)
    sql = ""
    if (where.size === 3)
      operators = [">", ">=", "=", "<=", "<"]
      field = where[0]
      operator = where[1]
      value = where[2]

      if (operators.includes? operator.to_s)
        sql = "#{action} from #{table} where #{field} #{operator} \"#{value.to_s}\""
      end
    end

    return query(sql)
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

  def get(action, table, where)
    return action(action, table, where)
  end
end

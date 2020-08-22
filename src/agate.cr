require "./agate/supermarket/beverages"
require "./agate/supermarket/databases"

module Agate
  puts "Time : #{Time.local} \n\n"

  market = Beverages.new
  db = Database.new

  # db.create_database
  # market.insert_data

  db.action("select *", "supermarket", ["items", "=", "Milk"])

  # name = {
  #   "app" => 123,
  #   "app2" => 123,
  # }

  # puts typeof(name)
  # puts typeof(Hash(String, Int32).new)
  # puts name.size
  # puts typeof(name) == typeof(Hash(String, Int32).new)
end

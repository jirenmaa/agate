require "./agate/supermarket/beverages"
require "./agate/supermarket/databases"

module Agate
  puts "Time : #{Time.local} \n\n"

  market = Beverages.new
  db = Database.new

  # db.create_database
  # market.insert_data

  db.action("select *", "supermarket", ["items", "=", "Milk"])
end

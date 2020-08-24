require "./agate/supermarket/beverages"
require "./agate/supermarket/databases"

module Agate
  puts "Time : #{Time.local} \n\n"

  beverages = Beverages.new
  db = Database.new

  # db.create_database
  # beverages.insert_data

  # beverages.show_data("category", "=", "Beverages")
  beverages.show_data()
end

require "./agate/supermarket/beverages"
require "./agate/supermarket/databases"

module Agate
  puts "Time : #{Time.local} \n\n"

  market = Beverages.new
  db = Database.new

  # db.create_database
  # market.insert_data

  items = db.get("select *", "supermarket", ["items", "=", "Milk"])

  items.each do |val|
    val.each do |key, value|
      puts "#{key.to_s} | #{value.to_s}"
    end
  end
end

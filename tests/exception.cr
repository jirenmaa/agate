args = {
  "Apple Juice" => 0,
  "Beer" => 0,
  "Coffee" => 0,
  "Milk" => 0,
  "Soda" => 0,
  "Tea" => 0,
  "Water" => 0,
}

# args = 123
category = "Beverages"

# puts typeof(args) == typeof(Hash(String, Int32).new)

# begin
#   if (args.is_a?(Hash(String, Int32)))
#     args.each do |key, value|
#       puts "insert into supermarket values (?, ?, ?)", "#{key.to_s}", value.to_i, "#{category}", "\n"
#     end
#   # else
#   #   raise "Error when inserting data to database"
#   end
# rescue ex
#   puts "asdasd"
# end

begin
  asd = 123
  x = 0
  while asd == "123" && x < 5
    puts asd
    x += 1
  end
rescue
  puts "asdawdasdawdsadawdsadwad"
  # puts "Exception raised due to: #{ex}"
end

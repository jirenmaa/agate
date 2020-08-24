require "./databases"

class Beverages
  @category : String
  @itemSize : Int32
  property items = {
    "Apple Juice" => 0,
    "Beer" => 0,
    "Coffee" => 0,
    "Milk" => 76,
    "Soda" => 0,
    "Tea" => 0,
    "Water" => 0,
  }

  def initialize
    @itemSize = items.size
    @category = "Beverages"
    @db = Database.new
  end

  def insert_data()
    @db.insert(@items, @category)
  end

  def show_data()
    # items = @db.get("select *", "supermarket", ["items", "=", "Milk"])
    items = @db.get("select *", "supermarket", ["category", "=", "Beverages"])

    puts "| Item\t| Stock\t| Category |"
    items.each do |val|
      val.each do |key, value|
        puts "#{value.to_s}"
      end
    end
    # pp items
  end
end
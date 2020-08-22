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
  end

  def insert_data()
    db = Database.new
    db.insert(@items, @category)
  end
end
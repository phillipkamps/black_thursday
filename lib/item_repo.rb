
require "pry"
class ItemRepository

  # attributes ...
  attr_reader :items_instances_array

  def initialize(items_instances_array)
    @items_instances_array = items_instances_array
  end

  def all
    items_instances_array
  end

  def find_by_id(id)
    items_instances_array.find do |item_instance|
    item_instance.item_attributes[:id] == id
    end
  end

  def find_by_name(name)
    items_instances_array.find do |item_instance|
    item_instance.item_attributes[:name] == name.downcase
    end
  end

  def find_all_with_description(string)
    items_instances_array.find_all do |item_instance|
      item_instance.item_attributes[:description].include?(string)
      end
  end

### see item_repo_spec.rb note, this returns 0 for integer=1200

  def find_all_by_price(integer)
#    items_instances_array.find_all do |item_instance|
#      item_instance.item_attributes[:unit_price].equal?(integer)
#      end
  end

###

  def find_all_by_price_in_range()
  end

  def find_all_by_merchant_id(input_id)
    items_instances_array.find_all do |item_instance|
      item_instance.item_attributes[:merchant_id].equal?(input_id)
      end
  end

end

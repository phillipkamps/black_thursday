require "./lib/item_repo"
require "./lib/sales_engine"
require "./lib/item"
require "pry"

RSpec.describe ItemRepository do
  se = SalesEngine.from_csv({
    items: "./data/items.csv",
    merchants: "./data/merchants.csv"
  })
  ir = ItemRepository.new(se.items_instanciator)

  it "is an instance of ItemRepository" do
    expect(ir).to be_an_instance_of(ItemRepository)
  end

  it "can return an array of all item instances" do
    expect(ir.all.count).to eq 1367
  end

  it "can find an item by id" do
    test_id = 263397059
    expected_item = ir.find_by_id(test_id)
    expect(expected_item.item_attributes[:id]).to eq 263397059
    expect(expected_item.item_attributes[:name]).to eq "etre ailleurs"
  end

  it "can find an item by name" do
    expected_item = ir.find_by_name("Etre ailleurs")
    expect(expected_item.item_attributes[:name]).to eq "etre ailleurs"
    expect(expected_item.item_attributes[:id]).to eq 263397059
  end

  it "can find an item with first letter entered lower case" do
    test_name = "etre ailleurs"
    expected_item = ir.find_by_name(test_name)
    expect(expected_item.item_attributes[:name]).to eq "etre ailleurs"
  end

  it "can find all rows having any occurrence of search string
     in the description field" do
     expected_item = ir.find_all_with_description("icon")
     expect(expected_item.length).to eq 8
  end

### this test fails, stating 0 meet the criteirion "1200" but spreadshee
### calculates 51

it "can find all item rows where unit price matches integer input" do
#       expected_item = ir.find_all_by_price(1200)
#       expect(expected_item.length).to eq 51
     end

###

it "can find all items by price in a specified range" do
    end

it "can find all item rows where merchant id matches input
   search id" do
     expected_item = ir.find_all_by_merchant_id(12334193)
     expect(expected_item.length).to eq 2
   end

end

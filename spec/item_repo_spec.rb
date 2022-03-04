require "./lib/merchant_repo"
require "./lib/customer_repo"
require "./lib/invoice_repo"
require "./lib/item_repo"
require "./lib/transaction_repo"
require "./lib/invoice_item_repo"
require "./lib/sales_engine"
require "./lib/item"
require "pry"

RSpec.describe ItemRepository do
  let(:se) do
    SalesEngine.from_csv({
      items: "./data/items.csv",
      merchants: "./data/merchants.csv",
      invoices: "./data/invoices.csv",
      customers: "./data/customers.csv",
      transactions: "./data/transactions.csv",
      invoice_items: "./data/invoice_items.csv"
    })
  end
  ir = ItemRepository.new("./data/items.csv")

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
    expect(expected_item.item_attributes[:name]).to eq "Etre ailleurs"
  end

  it "can find an item by name" do
    expected_item = ir.find_by_name("ETRE ailleurs")
    expect(expected_item.item_attributes[:name]).to eq "Etre ailleurs"
    expect(expected_item.item_attributes[:id]).to eq 263397059
  end

  it "creates a new item" do
    ir.create({name: "Widget"})
    expected_item = ir.find_by_id(263567475)
    expect(expected_item.item_attributes[:name]).to eq("Widget")
  end

  it "updates an invoice item" do
    ir.create({name: "Widget"})
    ir.update(263567475, {quantity: 111})
    expected_item = ir.find_by_id(263567475)
    expect(expected_item.item_attributes[:quantity]).to eq(111)
  end

  it "deletes an invoice item" do
    ir.create({name: "Widget"})
    ir.delete(263567475)
    expect(ir.find_by_id(263567475)).to eq nil
  end
end

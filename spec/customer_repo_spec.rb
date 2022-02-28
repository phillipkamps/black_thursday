require "./lib/sales_engine"
require "./lib/customer"
require "./lib/customer_repo"
require "Time"
require "pry"

RSpec.describe CustomerRepository do
  let(:se) do
    SalesEngine.from_csv({
      items: "./data/items.csv",
      merchants: "./data/merchants.csv",
      invoices: "./data/invoices.csv",
      customers: "./data/customers.csv"
    })
  end

  let(:cr) do
    CustomerRepository.new(se.customers_instanciator)
  end

  it "is an instance of CustomerRepository" do
    expect(cr).to be_an_instance_of(CustomerRepository)
  end

  it "returns an array of all customer instances" do
    expect(cr.all.count).to eq 1000
  end

  it "finds a customer by id" do
    expected_customer = cr.find_by_id(301)
    expect(expected_customer.customer_attributes[:id]).to eq 301
    expect(expected_customer.customer_attributes[:last_name]).to eq "wolf"
  end

  it "finds all customers with same first name" do
    expected_customers = cr.find_all_by_first_name("Helga")
    expect(expected_customers.count).to eq(3)
  end

  it "finds all customers with same last name" do
    expected_customers = cr.find_all_by_last_name("Johns")
    expect(expected_customers.count).to eq(4)
  end

  it "creates a new customer instance" do
    cr.create({first_name: "Cott",
               last_name: "Ullivan",
               created_at: Time.now,
               updated_at: Time.now})
    expected_customer = cr.find_by_id(1001)
    expect(expected_customer.customer_attributes[:first_name]).to eq("cott")
  end

  it "updates existing customer" do
    cr.create({first_name: "Cott",
               last_name: "Ullivan",
               created_at: Time.now,
               updated_at: Time.now})

    time = cr.find_by_id(1001).customer_attributes[:updated_at]
    attributes = {first_name: "Scott"}
    cr.update(1001, attributes)
    expect(cr.find_by_id(1001).customer_attributes[:first_name]).to eq("Scott")
    expect(cr.find_by_id(1001).customer_attributes[:updated_at]).to_not eq(time)
  end
end

#
#     it "#update updates a customer" do
#       original_time = engine.customers.find_by_id(1001).updated_at
#       attributes = {
#         last_name: "Smith"
#       }
#       engine.customers.update(1001, attributes)
#       expected = engine.customers.find_by_id(1001)
#       expect(expected.last_name).to eq "Smith"
#       expect(expected.first_name).to eq "Joan"
#       expect(expected.updated_at).to be > original_time
#     end
#
#     it "#update cannot update id or created_at" do
#       attributes = {
#         id: 2000,
#         created_at: Time.now
#       }
#       engine.customers.update(1001, attributes)
#       expected = engine.customers.find_by_id(2000)
#       expect(expected).to eq nil
#       expected = engine.customers.find_by_id(1001)
#       expect(expected.created_at).not_to eq attributes[:created_at]
#     end
#
#     it "#update on unknown customer does nothing" do
#       engine.customers.update(2000, {})
#     end
#
#     it "#delete deletes the specified customer" do
#       engine.customers.delete(1001)
#       expected = engine.customers.find_by_id(1001)
#       expect(expected).to eq nil
#     end
#
#     it "#delete on unknown customer does nothing" do
#       engine.customers.delete(2000)
#     end
#   end

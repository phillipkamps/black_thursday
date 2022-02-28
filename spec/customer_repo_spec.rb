require "./lib/sales_engine"
require "./lib/customer"
require "./"
require "pry"

RSpec.describe CustomerRepository do
  let(:se) do
    SalesEngine.from_csv({customers: "./data/customers.csv"})
  end

  let(:cr) do
    CustomerRepository.new(se.customers_instanciator)
  end

  it "is an instance of MerchantRepository" do
    expect(mr).to be_an_instance_of(MerchantRepository)
  end


  # context "Customer Repository" do
  #     it "#all returns all of the customers" do
  #       expected = engine.customers.all
  #       expect(expected.length).to eq 1000
  #       expect(expected.first.class).to eq Customer
  #     end
  #
  #     it "#find_by_id returns the customer with matching id" do
  #       id = 100
  #       expected = engine.customers.find_by_id(id)
  #
  #       expect(expected.id).to eq id
  #       expect(expected.class).to eq Customer
  #     end
  #
  #     it "#find_all_by_first_name returns all customers with matching first name" do
  #       fragment = "oe"
  #       expected = engine.customers.find_all_by_first_name(fragment)
  #
  #       expect(expected.length).to eq 8
  #       expect(expected.first.class).to eq Customer
  #     end
  #
  #     it "#find_all_by_last_name returns all customers with matching last name" do
  #       fragment = "On"
  #       expected = engine.customers.find_all_by_last_name(fragment)
  #
  #       expect(expected.length).to eq 85
  #       expect(expected.first.class).to eq Customer
  #     end
  #
  #     it "#find_all_by_first_name and #find_all_by_last_name are case insensitive" do
  #       fragment = "NN"
  #       expected = engine.customers.find_all_by_first_name(fragment)
  #
  #       expect(expected.length).to eq 57
  #       expect(expected.first.class).to eq Customer
  #
  #       fragment = "oN"
  #       expected = engine.customers.find_all_by_last_name(fragment)
  #
  #       expect(expected.length).to eq 85
  #       expect(expected.first.class).to eq Customer
  #     end
  #
  #     it "#create creates a new customer instance" do
  #       attributes = {
  #         :first_name => "Joan",
  #         :last_name => "Clarke",
  #         :created_at => Time.now,
  #         :updated_at => Time.now
  #       }
  #       engine.customers.create(attributes)
  #       expected = engine.customers.find_by_id(1001)
  #       expect(expected.first_name).to eq "Joan"
  #     end
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

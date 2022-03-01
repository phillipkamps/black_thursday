require "./lib/transaction_repo"
require "./lib/sales_engine"
require "./lib/transaction"
require "pry"

RSpec.describe TransactionRepository do
  let(:se) do
    SalesEngine.from_csv({
      items: "./data/items.csv",
      merchants: "./data/merchants.csv",
      invoices: "./data/invoices.csv",
      customers: "./data/customers.csv",
      transactions: "./data/transactions.csv"
    })
  end

  let(:tr) do
    TransactionRepository.new(se.transactions_instanciator)
  end

  it "is an instance of TransactionRepository" do
    expect(tr).to be_an_instance_of(TransactionRepository)
  end

  it "returns an array of all merchant instances" do
    expect(tr.all.count).to eq 4985
  end

end

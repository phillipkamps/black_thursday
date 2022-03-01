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

  it "finds a transaction by id" do
    expected_transaction = tr.find_by_id(730)
    expect(expected_transaction.transaction_attributes[:invoice_id]).to eq(3613)
  end

  it "finds all transactions by invoice id" do
    expected_transaction = tr.find_all_by_invoice_id(2850)
    expect(expected_transaction.length).to eq(3)
  end

  it "finds all transactions by cc #" do
    expected_transaction = tr.find_all_by_credit_card_number(4518913442963142)
    expect(expected_transaction.length).to eq(1)
  end

  it "finds all transactions by result" do
    expected_transaction = tr.find_all_by_result("success")
    expect(expected_transaction.length).to eq(4158)
  end
end

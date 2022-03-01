require "./lib/transaction_repo"
require "./lib/sales_engine"
require "./lib/transaction"
require "pry"

RSpec.describe TransactionRepository do
  let(:se) do
    SalesEngine.from_csv({})
  end
end

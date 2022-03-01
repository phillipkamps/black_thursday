require "pry"
class TransactionRepository

  attr_reader :transactions_instances_array

  def initialize(transactions_instances_array)
    @transactions_instances_array = transactions_instances_array
  end

  def all
    transactions_instances_array
  end

end

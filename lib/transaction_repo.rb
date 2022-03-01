require "pry"
class TransactionRepository
  attr_reader :transactions_instances_array

  def initialize(transactions_instances_array)
    @transactions_instances_array = transactions_instances_array
  end

  def all
    transactions_instances_array
  end

  def find_by_id(id)
    transactions_instances_array.find do |transaction_instance|
      transaction_instance.transaction_attributes[:id] == id
    end
  end

  def find_all_by_invoice_id(invoice_id)
    transactions_instances_array.find_all do |transaction_instance|
      transaction_instance.transaction_attributes[:invoice_id] == invoice_id
    end
  end

  def find_all_by_credit_card_number(number)
    transactions_instances_array.find_all do |transaction_instance|
      transaction_instance.transaction_attributes[:credit_card_number] == number
    end
  end

  def find_all_by_result(result)
    transactions_instances_array.find_all do |transaction_instance|
      transaction_instance.transaction_attributes[:result] == result
    end
  end

  def create(attributes)
    attributes[:id] = transactions_instances_array[-1].transaction_attributes[:id] + 1
    transactions_instances_array << Transaction.new(attributes)
  end

  def update(id, attributes)
    if !(attributes.include?(:id) || attributes.include?(:invoice_id) || attributes.include?(:created_at))
      find_by_id(id).transaction_attributes[:credit_card_number] = attributes[:credit_card_number]
      find_by_id(id).transaction_attributes[:credit_card_expiration_date] = attributes[:credit_card_expiration_date]
      find_by_id(id).transaction_attributes[:result] = attributes[:result]
    end
  end

  def delete(id)
    transactions_instances_array.delete(find_by_id(id))
  end
end

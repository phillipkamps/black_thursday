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
    # update Transaction instance having given id w/attrib provided;
    # ONLY update: CC-number, exp-date, result;
    # changes updated_at to be Time.now
  end

  def delete(id)
    # Transaction instance with given id
  end
end

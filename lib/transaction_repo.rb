require "pry"
class TransactionRepository

  attr_reader :transactions_instances_array

  def initialize(transactions_instances_array)
    @transactions_instances_array = transactions_instances_array
  end

  def all
    transactions_instances_array
  end

  def find_by_id
    # nil OR instance of Transaction with matching ID
  end

  def find_all_by_invoice_id
    # [] OR >= 1 matches
  end

  def find_all_by_credit_card_number
    # [] OR >= 1 matches
  end

  def find_all_by_result
    # [] OR >=1 matches
  end

  def create(attributes)
    # new Transaction instance w/attrib provided; curr HIGHEST TrID += 1
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

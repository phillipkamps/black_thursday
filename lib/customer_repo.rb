class CustomerRepository
  attr_reader :customers_instances_array
  def initialize(customers_instances_array)
    @customers_instances_array = customers_instances_array
  end

  def all
    customers_instances_array
  end
end

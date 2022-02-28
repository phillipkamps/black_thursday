class CustomerRepository
  attr_reader :customers_instances_array
  def initialize(customers_instances_array)
    @customers_instances_array = customers_instances_array
  end

  def all
    customers_instances_array
  end

  def find_by_id(id)
    customers_instances_array.find do |customer_instance|
      customer_instance.customer_attributes[:id] == id
    end
  end
end

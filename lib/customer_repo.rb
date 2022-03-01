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

  def find_all_by_first_name(first_name)
    customers_instances_array.find_all do |customer_instance|
      customer_instance.customer_attributes[:first_name] == first_name.downcase
    end
  end

  def find_all_by_last_name(last_name)
    customers_instances_array.find_all do |customer_instance|
      customer_instance.customer_attributes[:last_name] == last_name.downcase
    end
  end

  def create(attributes)
    attributes[:id] = customers_instances_array[-1].customer_attributes[:id] + 1
    attributes[:created_at] = Time.now
    attributes[:updated_at] = Time.now
    customers_instances_array << Customer.new(attributes)
  end

  def update(id, attributes)
    attributes.each do |attribute|
      find_by_id(id).customer_attributes[attribute[0]] = attribute[1]
    end
    find_by_id(id).customer_attributes[:updated_at] = Time.now
  end

  def delete(id)
    customers_instances_array.delete(find_by_id(id))
  end
end

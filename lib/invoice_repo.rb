require "pry"
require "invoice"

class InvoiceRepository
  attr_reader :invoices_instances_array
  def initialize(invoices_instance_array)
    @invoices_instances_array = invoices_instances_array
  end

  def all
    invoice_instance_array
  end

  def find_by_id(id)
    invoices_instances_array.find do |invoice_instance|
      invoices_instances.invoice_attributes[:id] == id
    end
  end

  def find_all_by_customer_id(id)
    invoices_instances_array.find_all do |invoice_instance|
      invoices_instances.invoice_attributes[:customer_id] == id
    end
  end

  def find_all_by_merchant_id(id)
    invoices_instances_array.find_all do |invoice_instance|
      invoices_instances.invoice_attributes[:merchant_id] == id
    end
  end

  def find_all_by_status(status)
    invoice_instances_array.find_all do |invoice_instance|
      invoices_instances.invoice_attributes[:status] == status
    end
  end

  def create(attributes)
    attributes[:id] = invoices_instance_array[-1].invoice_attributes[:id] + 1
    attributes[:created_at] = Time.now
    attributes[:updated_at] = Time.now
    invoices_instances_array << Invoice.new(attributes)
  end

  def update(id, attributes)
    attributes.each do |attribute|
      if !(attributes.include?(:id) || attributes.include?(:created_at))
        find_by_id(id).invoice_attributes[attribute[0]] = attribute[1]
      end
    end
    find_by_id(id).invoice_attributes[:updated_at] = Time.now
  end

  def delete(id)
    invoices_instances_array.delete(find_by_id(id))
  end
end

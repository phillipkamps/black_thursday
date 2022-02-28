require "csv"
require "merchant"
require "item"
require "pry"

class SalesEngine
  attr_reader :merchants_instances_array, :customers_instances_array
  def initialize(data)
    @items_data = data[:items]
    @merchants_data = data[:merchants]
    @customers_data = data[:customers]
    @customers_instances_array = []
    @merchants_instances_array = []
  end

  def self.from_csv(argument)
    items = CSV.read(argument[:items], headers: true, header_converters: :symbol)
    merchants = CSV.read(argument[:merchants], headers: true, header_converters: :symbol)
    customers = CSV.read(argument[:customers], headers: true, header_converters: :symbol)

    SalesEngine.new({items: items, merchants: merchants, customers: customers})
  end

  def items
    @items_data
  end

  def merchants
    @merchants_data
  end

  def customers
    @customers_data
  end

  def items_instanciator
    items_instances_array = []
    items.by_row!.each do |row|
      items_instances_array << Item.new(row)
    end
    items_instances_array
  end

  def merchants_instanciator
    merchants.by_row!.each do |row|
      merchants_instances_array << Merchant.new(row)
    end
    merchants_instances_array
  end

  def customers_instanciator
    customers.by_row!.each do |row|
      customers_instances_array << Customer.new(row)
    end
    customers_instances_array
  end
end

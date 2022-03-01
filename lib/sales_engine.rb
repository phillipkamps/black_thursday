require "csv"
require "merchant"
require "item"
require "transaction"
require "pry"

class SalesEngine
  attr_reader :merchants_instances_array
  def initialize(data)
    @items_data = data[:items]
    @merchants_data = data[:merchants]
    @invoices_data = data[:invoices]
    @customers_data = data[:customers]
    @transactions_data = data[:transactions]
    @merchants_instances_array = []
  end

  def self.from_csv(argument)
    items = CSV.read(argument[:items], headers: true, header_converters: :symbol)
    merchants = CSV.read(argument[:merchants], headers: true, header_converters: :symbol)
    invoices = CSV.read(argument[:invoices], headers: true, header_converters: :symbol)
    customers = CSV.read(argument[:customers], headers: true, header_converters: :symbol)
    transactions = CSV.read(argument[:transactions], headers: true, header_converters: :symbol)
    SalesEngine.new({items: items, merchants: merchants, invoices: invoices, customers: customers, transactions: transactions})
  end

  def items
    @items_data
  end

  def merchants
    @merchants_data
  end

  def invoices
    @invoices_data
  end

  def customers
    @customers_data
  end

  def transactions
    @transactions_data
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
      @merchants_instances_array << Merchant.new(row)
    end
    @merchants_instances_array
  end

  def invoices_instanciator
    invoices.by_row!.each do |row|
      invoices_instances_array << Invoice.new(row)
    end
  end

  def customers_instanciator
    customers.by_row!.each do |row|
      customers_instances_array << Customer.new(row)
    end
  end

  def transactions_instanciator
    transactions_instances_array = []
    transactions.by_row!.each do |row|
      transactions_instances_array << Transaction.new(row)
    end
    transactions_instances_array
  end
end

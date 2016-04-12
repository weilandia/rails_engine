require 'csv'

namespace :db do
  desc 'create records from data/*.csv'
  task load_csv: :environment do
    CSV.foreach('data/customers.csv', headers: true, header_converters: :symbol) do |row|
      record = Customer.create(row.to_h)
      puts "#{record.class.to_s} - #{record.id} created"
    end

    CSV.foreach('data/merchants.csv', headers: true, header_converters: :symbol) do |row|
      record = Merchant.create(row.to_h)
      puts "#{record.class.to_s} - #{record.id} created"
    end

    CSV.foreach('data/items.csv', headers: true, header_converters: :symbol) do |row|
      row[:unit_price] = row[:unit_price].to_f / 100
      record = Item.create(row.to_h)
      puts "#{record.class.to_s} - #{record.id} created"
    end

    CSV.foreach('data/invoices.csv', headers: true, header_converters: :symbol) do |row|
      record = Invoice.create(row.to_h)
      puts "#{record.class.to_s} - #{record.id} created"
    end

    CSV.foreach('data/invoice_items.csv', headers: true, header_converters: :symbol) do |row|
      row[:unit_price] = row[:unit_price].to_f / 100
      record = InvoiceItem.create(row.to_h)
      puts "#{record.class.to_s} - #{record.id} created"
    end

    CSV.foreach('data/transactions.csv', headers: true, header_converters: :symbol) do |row|
      record = Transaction.create(row.to_h)
      puts "#{record.class.to_s} - #{record.id} created"
    end
  end
end

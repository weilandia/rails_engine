class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :customers, through: :invoices

  default_scope { order(id: :asc) }

  def self.most_revenue(number)
    select( "items.*",
            "SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue" )
      .joins(invoices: [:transactions, :invoice_items])
      .where(transactions: { result: 'success' })
      .group(:id)
      .reorder('revenue DESC')
      .take(number)
  end

  def self.most_items(number)
    select( "items.*","SUM(invoice_items.quantity) AS item_count")
      .joins(invoices: :transactions)
      .where(transactions: { result: 'success' })
      .group(:id)
      .reorder('item_count DESC')
      .take(number)
  end
end

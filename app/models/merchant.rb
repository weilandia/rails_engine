class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices

  validates :name, presence: true

  default_scope { order(id: :asc) }

  def self.most_revenue(number)
    select( "merchants.*",
            "SUM(invoice_items.unit_price * invoice_items.quantity) AS revenue" )
      .joins(invoices: [:transactions, :invoice_items])
      .where('transactions.result = ?', 'success')
      .group(:id)
      .reorder('revenue DESC')
      .take(number)
  end

  def self.most_items(number)
    select( "merchants.*",
            "SUM(invoice_items.quantity) AS item_count")
      .joins(invoices:
      [:transactions, :invoice_items, :items])
      .where('transactions.result = ?', 'success')
      .group(:id)
      .reorder('item_count DESC')
      .take(number)
  end

  def successful_invoices
    invoices.joins(:transactions, :invoice_items).where("result = 'success'")
  end

  def revenue
    successful_invoices.sum("unit_price * quantity").to_f
  end
end

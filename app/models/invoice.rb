class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  default_scope { order(id: :asc) }

  def self.revenue_by_date(date)
    where(created_at: date)
      .joins(:invoice_items, :transactions)
      .where(transactions: { result: 'success' })
      .sum('invoice_items.quantity * invoice_items.unit_price')
  end
end

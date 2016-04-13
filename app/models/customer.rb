class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items

  default_scope { order(id: :asc) }

  def self.favorite_customer_by_merchant(merchant_id)
    joins(:transactions, :invoices)
      .where(invoices: { merchant_id: merchant_id })
      .where(transactions: { result: 'success' })
      .group(:id)
      .reorder('transactions.count DESC')
      .first
  end

  def self.customers_with_pending_invoices_by_merchant(merchant_id)
    joins(:transactions, :invoices)
      .where(invoices: { merchant_id: merchant_id })
      .where(transactions: { result: 'failed' })
      .group(:id)
      .reorder('transactions.count DESC')
  end
end

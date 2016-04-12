class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items
  validates :first_name, presence: true
  validates :last_name, presence: true

  default_scope { order(id: :asc) }
end

require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should have_many :invoices }
  it { should have_many :invoice_items }
  it { should have_many :transactions }
  it { should have_many :items }
  it { should have_many :merchants }
end

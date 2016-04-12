require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it { should validate_presence_of :credit_card_number}
  it { should validate_presence_of :result}
  it { should belong_to :invoice }
  it { should have_one :customer }
  it { should have_one :merchant }
end

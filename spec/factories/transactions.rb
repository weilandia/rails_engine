FactoryGirl.define do
  factory :transaction do
    invoice nil
    credit_card_number "4242424242424242"
    result "success"
  end
end

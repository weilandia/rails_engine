FactoryGirl.define do
  factory :transaction do
    invoice nil
    credit_card_number "4242424242424242"
    credit_card_expiration_date nil
    result "success"
  end
end

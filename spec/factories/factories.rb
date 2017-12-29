FactoryGirl.define do
  factory :record do
    title "Record Title"
    date  "2017-01-03"
    amount "25000"
  factory :invalid_record do
      amount "asdasasf"
  end
end
end
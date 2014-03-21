FactoryGirl.define do
  factory :user do
    name 'Lil Wayne'
    email 'lilwayne@cashmoolah.com'
    password 'source101010'
  end

  factory :expense do
    name 'Food'
    amount 12.5
    posted_at Time.now
  end  
end
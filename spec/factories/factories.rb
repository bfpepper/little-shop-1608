FactoryGirl.define do

  sequence :title do |n|
    "Trip#{n}"
  end

  sequence :description do |n|
    "Trip text #{n}"
  end

  sequence :price do |n|
    "#{n.to_f}"
  end

  factory :trip do
    title
    description
    image_url "http://logolagoon.com/wp-content/uploads/2013/12/free-frog-logo.png"
    price
  end
end

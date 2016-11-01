FactoryGirl.define do

  sequence :category_title do |n|
    "category#{n}"
  end

  sequence :title do |n|
    "Trip#{n}"
  end

  sequence :description do |n|
    "Trip text #{n}"
  end

  sequence :price do |n|
    "#{n.to_f}"
  end

  factory :category do
    title {generate(:category_title)}
  end

  factory :trip do
    title
    description
    image_url "http://logolagoon.com/wp-content/uploads/2013/12/free-frog-logo.png"
    price
    factory :trip_with_category do
      category {create(:category)}
    end
  end
end

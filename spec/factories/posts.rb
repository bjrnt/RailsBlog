FactoryGirl.define do
  factory :post do
    title 'My Post'
    content 'My content'
    author_id 1
    is_public true
    category_id 1

    trait :private do
      is_public false
    end

    trait :has_image do
      img_url '/prog.jpg'
    end

  end
end

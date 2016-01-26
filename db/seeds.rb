# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category_programming = Category.create(title: 'Programming')
category_reviews = Category.create(title: 'Reviews')

author_bjorn = Author.create(name: 'Bjorn', email: 'b.tegelund@gmail.com', password: 'lolcontrol')

programming_post1 = Post.create(
  title: 'Adding Numbers in Ruby',
  author_id: author_bjorn.id,
  content: 'You can easily add two numbers in Ruby by putting a "+" between them. Try entering "2 + 2" into irb and observe the result. You will see that it is, indeed, 4.',
  is_public: true,
  category_id: category_programming.id,
  img_url: 'prog.jpg',
  created_at: Date.new(2016, 1, 1)
)

programming_post2 = Post.create(
  title: 'Printing Hello World in Ruby',
  author_id: author_bjorn.id,
  content: "Here's a cool way to print \"Hello, World\" in Ruby!\nprint \"Hello, World!\"",
  is_public: true,
  img_url: 'prog.jpg',
  category_id: category_programming.id,
  created_at: Date.new(2016, 1, 5)
)

reviews_post1 = Post.create(
  title: 'Review of Cafe "Coffeenie" in Hongdae',
  author_id: author_bjorn.id,
  content: "It's a nice cafe - I would go again.\n5/5",
  is_public: true,
  img_url: 'review.jpg',
  category_id: category_reviews.id,
  created_at: Date.new(2016, 1, 3)
)

reviews_post2 = Post.create(
  title: 'Review of LG G3 Cat.6',
  author_id: author_bjorn.id,
  content: 'TODO: Add some content',
  is_public: false,
  img_url: nil,
  category_id: 2,
  created_at: Date.new(2016, 1, 9)
)

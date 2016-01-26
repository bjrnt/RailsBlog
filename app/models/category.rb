class Category < ActiveRecord::Base
  has_many :posts

  validates :title, presence: true, allow_blank: false
end

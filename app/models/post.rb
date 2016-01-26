class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :author

  validates :title, presence: true, allow_blank: false
  validates :author_id, presence: true
  validates :content, presence: true, allow_blank: false
  validates :category_id, presence: true
end

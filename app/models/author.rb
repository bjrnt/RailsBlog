class Author < ActiveRecord::Base
  has_secure_password
  has_many :posts

  validates :name, presence: true, allow_blank: false
  validates :email, presence: true, allow_blank: false
  validates :password_digest, presence: true, allow_blank: false
end

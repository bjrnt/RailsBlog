require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'has a valid factory' do
    expect(build(:post)).to be_valid
  end

  it 'is invalid without a title/author/content/category' do
    expect(build(:post, title: nil)).to_not be_valid
    expect(build(:post, author: nil)).to_not be_valid
    expect(build(:post, content: nil)).to_not be_valid
    expect(build(:post, category_id: nil)).to_not be_valid
  end
end

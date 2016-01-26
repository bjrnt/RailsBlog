require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'has a valid factory' do
    expect(build(:category)).to be_valid
  end
  
  it 'is invalid without a title' do
    expect(build(:category, title: nil)).to_not be_valid
  end

  it 'is invalid for an empty title' do
    expect(build(:category, title: '')).to_not be_valid
  end
end

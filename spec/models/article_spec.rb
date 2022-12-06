require 'rails_helper'

RSpec.describe Article, type: :model do
  before(:each) do
    @user = User.create(email: 'example@gmail.com', password: '123456')
    @article = Article.create(title: 'Title', description: 'Description', user_id: @user.id)
  end

  it 'is valid with valid attributes' do
    expect(@article).to be_valid
  end

  it 'is not valid without a title' do
    @article.title = nil
    expect(@article).to_not be_valid
  end

  it 'is not valid without a description' do
    @article.description = nil
    expect(@article).to_not be_valid
  end

  it 'is not valid without a user_id' do
    @article.user_id = nil
    expect(@article).to_not be_valid
  end
end

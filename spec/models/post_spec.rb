require 'rails_helper'

RSpec.describe Post, type: :model do

  describe 'create' do

    before do
      @user = FactoryGirl.create(:user)
      @post = FactoryGirl.create(:post)
    end

    it 'can be created' do
      expect(@post).to be_valid
    end

    it 'requires a level' do
      @post.level = nil
      expect(@post).to_not be_valid
    end

    it 'requires a user' do
      @post.user = nil
      expect(@post).to_not be_valid
    end

    it 'can be created with notes' do
      @post.notes = 'test notes'
      expect(@post).to be_valid
    end

  end

end

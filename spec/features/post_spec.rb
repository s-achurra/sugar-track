require 'rails_helper'

describe 'Post Navigation' do
  let(:user) { FactoryGirl.create(:user) }
  let(:post) { FactoryGirl.create(:post, :user => user) }

  before do
    login_as(user, :scope => :user)
  end

  describe 'index' do
    describe 'while logged in' do
      before do
        visit posts_path
      end

      it 'can be reached successfully' do
        expect(page.status_code).to eq(200)
      end

      it 'has a title of Posts' do
        expect(page).to have_content(/Posts/)
      end

      it 'has a list of posts' do
        newPost = FactoryGirl.create(:post, :user => user)
        visit posts_path
        expect(page).to have_content(/#{newPost.id}/)
      end

      it 'has a scope so only owned posts are visible' do
        other_user_post = FactoryGirl.create(:post_from_other_user)
        visit posts_path
        expect(page).to_not have_content(/#{other_user_post.id}/)
      end

    end

    describe 'while logged out' do
      before do
        logout
        visit posts_path
      end

      it 'can be reached successfully' do
        expect(page.status_code).to eq(200)
      end

      it 'has a title of Log In' do
        expect(page).to have_content(/Log in/)
      end
    end
  end

  describe 'new' do
    xit 'has a New link from the main page' do
    end
  end

  describe 'delete' do
    xit 'can be deleted' do
      newPost = FactoryGirl.create(:post, :user => user)
      visit posts_path

      click_link("delete_#{newPost.id}")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'creation' do
    # before do
    #   visit new_post_path
    # end

    xit 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    xit 'can be created from new form page' do
      fill_in 'post[level]', with: 120
      fill_in 'post[notes]', with: 'test notes'

      expect { click_on 'Save' }.to change(Post, :count).by(1)
    end

    xit 'will have a users association' do
      fill_in 'post[level]', with: 120
      click_on 'Save'

      expect(Post.last.user).to_not be nil
    end
  end

  describe 'edit' do

    xit 'can be edited' do
      visit edit_post_path(post)

      fill_in 'post[level]', with: 130
      click_on 'Save'

      expect(page).to have_content(130)
    end

  end
end

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    context 'with no credentials' do
      it 'does not show private posts' do
        public_posts = Post.where(is_public: true)
        get :index
        expect(assigns(:posts)).to match_array(public_posts)
      end
    end
  end

  ## Add this test after authentication has been implemented
  #describe 'GET #show' do
  #  context 'with no credentials' do
  #    it 'does not show private posts' do
  #      create(:post, is_public: false)
  #      private_post = Post.find_by(is_public: false)
  #      get :show, {:id => private_post.id}
  #      expect(response).to be_success
  #    end
  #  end
  #end

end

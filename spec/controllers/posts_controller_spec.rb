require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  context 'with no credentials' do
    it 'does not show private posts' do
      public_posts = Post.where(is_public: true)
      get :index
      expect(assigns(:posts)).to match_array(public_posts)
    end

    it 'does not #show private posts' do
      post = create(:post, is_public: false)
      expect { get :show, {:id => post.id} }.to raise_error(ActionController::RoutingError)
    end

    it 'does not allow the user to edit posts' do
      post = create(:post)
      get :edit, {:id => post.id}
      expect(response).not_to be_success
    end

    it 'does not allow users to update posts' do
      post = create(:post)
      post.title = "New Title"
      patch :update, post.attributes
      expect(response).not_to be_success
    end

    it 'does not allow users to delete posts' do
      post = create(:post)
      delete :destroy, {:id => post.id}
      expect(response).not_to be_success
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

require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe 'GET #show' do
    context 'without credentials' do
      it 'is able to show a category which contains posts' do
        category = create(:category)
        post = create(:post, category_id: category.id)
        get :show, {:id => category.id}
        expect(response).to be_success
        expect(assigns(:category)).to eq(category)
      end

      it 'does show public posts' do
        category = create(:category)
        post = create(:post, category_id: category.id)
        get :show, {:id => category.id}
        expect(assigns(:posts)).to match_array([post])
      end

      it 'does not show private posts' do
        category = create(:category)
        public_post = create(:post, category_id: category.id)
        private_post = create(:post, category_id: category.id, is_public: false)
        get :show, {:id => category.id}
        expect(assigns(:posts)).to match_array([public_post])
      end
    end
  end
end

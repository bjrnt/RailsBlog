require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  it 'is able to render login template' do
    get :new
    expect(response).to be_success
    expect(response).to render_template('new')
  end
end

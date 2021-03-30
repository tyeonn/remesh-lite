require 'rails_helper'

RSpec.describe ConversationsController, type: :controller do
  describe 'GET #index' do
    it 'renders convo index' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'GET #show' do
    it 'renders convo show' do
      c = Conversation.create(title:'hi', start_date: Date.today)
      get :show, params: {id: c.id} 
      expect(response.status).to eq(200)
    end
  end

  describe 'POST #create' do
    context 'with invalid params' do
      it 'raises an exception' do
        expect{ post :create, {} }.to raise_error(ActionController::ParameterMissing)
      end
    end
    context 'with valid params' do
      it 'redirect to convo show' do
        post :create, params: {conversation: {title:'hi', start_date: Date.today}}
        expect(response).to redirect_to(conversation_path(Conversation.find_by(title: 'hi')))
      end
    end
  end
end

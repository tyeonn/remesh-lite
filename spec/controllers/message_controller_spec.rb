require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe 'GET #index' do
    it 'renders message index' do
      c = Conversation.create(title:'hi', start_date: Date.today)
      m = Message.create(text:'hello', sent_date: Date.today, conversation_id: c.id)
      get :index, params: {conversation_id: c.id, search_msg: '%he%'}
      expect(response.status).to eq(200)
    end
  end
  describe 'GET #show' do
    it 'renders message show' do
      c = Conversation.create(title:'hi', start_date: Date.today)
      m = Message.create(text:'hi', sent_date: Date.today, conversation_id: c.id)
      get :show, params: {conversation_id: c.id, id: m.id} 
      expect(response.status).to eq(200)
    end
  end
  describe 'POST #create' do
    context 'with invalid params' do
      it 'raises an exception' do
        expect{ post :create, {} }.to raise_error(ActionController::UrlGenerationError)
      end
    end
    
    context 'with valid params' do
      it 'redirect to convo show' do
        c = Conversation.create(title:'hi', start_date: Date.today)
        post :create, params: { 
          message: {
            text:'hi', 
            sent_date: Date.today
          },
          conversation_id: c.id
        }

        expect(response).to redirect_to(conversation_path(c.id))
      end
    end
  end
end

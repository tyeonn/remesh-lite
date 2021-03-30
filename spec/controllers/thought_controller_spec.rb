require 'rails_helper'

RSpec.describe ThoughtsController, type: :controller do
  describe 'POST #create' do
    context 'with invalid params' do
      it 'raises an exception' do
        expect{ post :create, {} }.to raise_error(ActionController::UrlGenerationError)
      end
    end
    
    context 'with valid params' do
      it 'redirect to msg show' do
        c = Conversation.create(title:'hi', start_date: Date.today)
        m = Message.create(text:'hello', sent_date: Date.today, conversation_id: c.id)
        post :create, params: { 
          thought: {
            text:'hi', 
            sent_date: Date.today
          },
          message_id: m.id,
          conversation_id: c.id
        }

        expect(response).to redirect_to(conversation_message_path(c.id, m.id))
      end
    end
  end
end

require 'rails_helper'

feature 'thought features', type: :feature do
  feature 'make new thought' do 
    before(:each) do
      create_convo('tim', Date.today)
      c = Conversation.find_by(title: 'tim')
      create_msg('hi', Date.today, c.id)
    end

    scenario 'with invalid params' do 
      c = Conversation.find_by(title: 'tim')
      m = Message.find_by(text: 'hi')
      create_thought('thought test', nil, c.id, m.id)
      expect(page).to have_content("Sent date can't be blank")
    end
    
    scenario 'with valid params' do
      c = Conversation.find_by(title: 'tim')
      m = Message.find_by(text: 'hi')
      create_thought('thought test', Date.today, c.id, m.id)
      # save_and_open_page
      expect(current_path).to eq("/conversations/#{c.id}/messages/#{m.id}")
      expect(page).to have_content("thought test")
    end

  end

end
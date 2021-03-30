require 'rails_helper'

feature 'message features', type: :feature do
  feature 'make new message' do 
    before(:each) do
      create_convo('tim', Date.today)
    end
    scenario 'with invalid params' do 
      c = Conversation.find_by(title: 'tim')
      create_msg('hi', nil, c.id)
      # expect(current_path).to eq('/conversations')
      expect(page).to have_content("Sent date can't be blank")
    end
    
    scenario 'with valid params' do
      c = Conversation.find_by(title: 'tim')
      create_msg('hi', Date.today, c.id)
      # save_and_open_page
      
      expect(current_path).to eq("/conversations/#{c.id}")
      expect(page).to have_content("hi")
    end
  end
  
  feature 'search for msg' do
    before(:each) do
      create_convo('tim', Date.today)
      c = Conversation.find_by(title: 'tim')
      create_msg('hi', Date.today, c.id)
    end
    
    scenario 'Search for i when Message hi exists' do
      fill_in 'search_msg', with: 'i'
      click_on 'Search'
      expect(page).to have_content("hi")
    end
    
    scenario 'Search for ap when Message apple exists. Should not show hi message' do
      c = Conversation.find_by(title: 'tim')
      create_msg('apple', Date.today, c.id)
      fill_in 'search_msg', with: 'ap'
      click_button 'Search'
      expect(page).not_to have_content("hi")
      expect(page).to have_content("apple")
    end

  
  end

end
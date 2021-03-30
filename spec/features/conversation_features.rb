require 'rails_helper'

feature 'conversation features', type: :feature do
  feature 'make new conversation' do 
    scenario 'with invalid params' do 
      create_convo('tim', nil)
      expect(current_path).to eq('/conversations')
      expect(page).to have_content("Start date can't be blank")
    end
    
    scenario 'with valid params' do
      create_convo('tim', Date.today)
      expect(current_path).to eq("/conversations/#{Conversation.find_by(title: 'tim').id}")
      expect(page).to have_content("tim")
    end

  end
  
  feature 'search for conversation' do
    before(:each) do
      create_convo('hello', Date.today)
      visit('/')
    end

    scenario 'Search for e when Conversation hello exists' do
      fill_in 'search', with: 'e'
      click_on 'commit'
      expect(page).to have_content("hello")
    end
    
    scenario 'Search for ap when Conversation apple exists. Should not show hello convo' do
      create_convo('apple', Date.today)
      visit('/')
      fill_in 'search', with: 'ap'
      click_button 'Search'
      expect(page).not_to have_content("hello")
      expect(page).to have_content("apple")
    end

  end

end
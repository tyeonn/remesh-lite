# == Schema Information
#
# Table name: conversations
#
#  id         :bigint           not null, primary key
#  start_date :datetime         not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Conversation, type: :model do
  subject(:conversation) {FactoryBot.build(:conversation)}
  
  describe 'validations' do
    it { should validate_presence_of(:title) } 
    it { should validate_presence_of(:start_date) } 
    
  end

  describe 'associations' do
    it { should have_many(:messages) }
  end
end

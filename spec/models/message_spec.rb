# == Schema Information
#
# Table name: messages
#
#  id              :bigint           not null, primary key
#  sent_date       :datetime         not null
#  text            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  conversation_id :integer          not null
#
require 'rails_helper'

RSpec.describe Message, type: :model do

  subject(:message) {FactoryBot.build(:message)}

  describe 'validations' do
    it { should validate_presence_of(:text) } 
    it { should validate_presence_of(:sent_date) } 
    it { should validate_presence_of(:conversation_id) } 
  end

  describe 'associations' do
    it { should belong_to(:conversation)}
    it { should have_many(:thoughts) }
  end
end

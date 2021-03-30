# == Schema Information
#
# Table name: thoughts
#
#  id         :bigint           not null, primary key
#  sent_date  :datetime         not null
#  text       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  message_id :integer          not null
#
require 'rails_helper'

RSpec.describe Thought, type: :model do

  subject(:thought) {FactoryBot.build(:thought)}
  
  describe 'validations' do
    it { should validate_presence_of(:text) } 
    it { should validate_presence_of(:sent_date) } 
    it { should validate_presence_of(:message_id) } 
  end

  describe 'associations' do
    it { should belong_to(:message)}
  end
end

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
class Message < ApplicationRecord
    validates :text, :sent_date, :conversation_id, presence: true
    belongs_to :conversation
    has_many :thoughts, dependent: :destroy
end




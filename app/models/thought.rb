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
class Thought < ApplicationRecord
    validates :text, :sent_date, presence: true

    belongs_to :message
end

                

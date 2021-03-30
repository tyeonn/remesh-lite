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
class Conversation < ApplicationRecord
  validates :title, :start_date, presence: true
  has_many :messages, dependent: :destroy
end

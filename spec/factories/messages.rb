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
FactoryBot.define do
  factory :message do
    text { Faker::Food.description }
    sent_date { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
  end
end

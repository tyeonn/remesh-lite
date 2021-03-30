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
FactoryBot.define do
  factory :conversation do
    title { Faker::Food.dish }
    start_date { Faker::Date.between(from: '1965-01-01', to: '2030-01-01') }
  end
end

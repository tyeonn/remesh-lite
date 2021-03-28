# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Conversation.destroy_all
Message.destroy_all
Thought.destroy_all

games = Conversation.create!(
  title: 'Games', 
  start_date: DateTime.current.to_date
)
overwatch = Message.create!(
  text: 'Overwatch', 
  sent_date: DateTime.current.to_date,
  conversation_id: games.id
)
csgo = Message.create!(
  text: 'CS:Go', 
  sent_date: DateTime.current.to_date,
  conversation_id: games.id
)
ow_thought1 = Thought.create!(
  text: 'nice', 
  sent_date: DateTime.current.to_date, 
  message_id: overwatch.id
)
ow_thought2 = Thought.create!(
  text: 'bad', 
  sent_date: DateTime.current.to_date, 
  message_id: overwatch.id
)



whiskey = Conversation.create!(
  title: 'Whiskey', 
  start_date: DateTime.current.to_date
)
w1 = Message.create!(
  text: '1792', 
  sent_date: DateTime.current.to_date,
  conversation_id: whiskey.id
)
w1_thought1 = Thought.create!(
  text: 'no, bruichladdich is better', 
  sent_date: DateTime.current.to_date, 
  message_id: w1.id
)


coffee = Conversation.create!(
  title: 'Coffee Methods', 
  start_date: DateTime.current.to_date
)
pour_over = Message.create!(
  text: 'Pour over', 
  sent_date: DateTime.current.to_date,
  conversation_id: coffee.id
)
espresso = Message.create!(
  text: 'espresso', 
  sent_date: DateTime.current.to_date,
  conversation_id: coffee.id
)
pour_thought1 = Thought.create!(
  text: 'Cafec Flower dripper', 
  sent_date: DateTime.current.to_date, 
  message_id: pour_over.id
)
espresso_thought1 = Thought.create!(
  text: 'too bitter', 
  sent_date: DateTime.current.to_date, 
  message_id: espresso.id
)



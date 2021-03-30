# README
### Requirements
1. ruby 2.5.8 `ruby -v`
2. postgresql 
3. gem rails and bundler 
4. node >= 10.17.0 `node -v`

### Setup for above
For ruby, can use rbenv and brew 
  1. `brew install rbenv`
  2. `rbenv install 2.5.8`
  3. `rbenv local 2.5.8` (from within same directory of proj)

For psql: https://postgresapp.com/

For rails and bundler: `gem install rails bundler`

For node: `brew install node` or `brew upgrade node`
  
### Instructions
1. In the project directory, run `bundle install`
2. run `npm install`
3. run `rails db:setup` (have postgres app running beforehand)
4. run `bundle exec rails s`
5. open http://localhost:3000/ in browser (preferably chrome)
6. If you get a webpacker error, close the server and try `bundle exec rails webpacker:install` then restart server (step 4)


### Remesh lite
Search is based on any matches, for example, if you have a conversation called 'hello', searching for 'e' will find it.
Search is done with psql `ILIKE` query

For routes, run `rails routes`

Tests are in spec/ folder

For the dates in create convo/message/thought, the prompt mentions 'users should be able to input the following required fields' so I did not implement any restrictions. 

### Features
1. Create convo
2. Create msg
3. Create thought
4. Search convos
5. Search msgs

  

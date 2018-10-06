# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create! email:"hoangtuyb96@gmail.com", password: "863991"
User.create! email:"test@gmail.com", password: "863991"                     
Game.create name: "abc"
Game.create name: "abcashduihsa"
Review.create! content: "asduhasudh", user_id: 1, game_id:1
Review.create! content: "asduashduihauisdh", user_id: 1, game_id:2      
Comment.create! user_id:1, review_id: 1, content: "ashduiashida"
Comment.create! user_id:1, review_id: 1, content: "ashduiashduahsd"
Comment.create! user_id:2, review_id: 1, content: "ashduiashduahsd" 
Comment.create! user_id:2, review_id: 1, content: "ashduiashduahsd"
Comment.create! user_id:2, review_id: 1, content: "ashduiashduahsdasuihduiashdu"
Like.create! likeable_id: 1, likeable_type: "Comment", user_id: 1
Like.create! likeable_id: 1, likeable_type: "Review", user_id: 1
Like.create! likeable_id: 1, likeable_type: "Comment", user_id: 2

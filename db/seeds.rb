# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create! email: "hoangtuyb96@gmail.com", password: "863991"
User.create! email: "test@gmail.com", password: "863991"
Game.create name: "Generation Streets", relase_date: DateTime.new(2018, 06, 10), summary: "Generation Streets, a game based on the real-world map. Load your hometown, find your place and this casual shooter start giving you very unexpected impressions. Almost any point on Earth is available to load except the North pole and Antarctica."
Game.create name: "Assassin's creed Odyssey", relase_date: DateTime.new(2018, 10, 16), summary: "Choose your fate in Assassin's Creed® Odyssey. From outcast to living legend, embark on an odyssey to uncover the secrets of your past and change the fate of Ancient Greece."
Review.create! content: "It's good!", user_id: 1, game_id: 1, rating: 4
Review.create! content: "It's not interesting", user_id: 1, game_id: 1, rating: 3
Review.create! content: "Awesome!!!", user_id: 1, game_id: 2, rating: 5
Comment.create! user_id: 1, review_id: 1, content: "ashduiashida"
Comment.create! user_id: 1, review_id: 1, content: "ashduiashduahsd"
Comment.create! user_id: 2, review_id: 1, content: "ashduiashduahsd"
Comment.create! user_id: 2, review_id: 1, content: "ashduiashduahsd"
Comment.create! user_id: 2, review_id: 1, content: "ashduiashduahsdasuihduiashdu"
Like.create! likeable_id: 1, likeable_type: "Comment", user_id: 1
Like.create! likeable_id: 1, likeable_type: "Review", user_id: 1
Like.create! likeable_id: 1, likeable_type: "Comment", user_id: 2
Platform.create name: "Windows", version: 8.1
Platform.create name: "iOS", version: 11.4
GamePlatform.create game_id: 1, platform_id: 1
GamePlatform.create game_id: 2, platform_id: 2
Photo.create game_id: 1, image: "generation_streets_1"
Photo.create game_id: 1, image: "generation_streets_2"
Photo.create game_id: 2, image: "assassin_creed_odyssey_1"
Photo.create game_id: 2, image: "assassin_creed_odyssey_2"

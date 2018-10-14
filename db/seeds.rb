# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create! email: "hoangtuyb96@gmail.com", full_name: "abc xyz", password: "863991",  confirmed_at: "2018-10-11 11:28:26"
User.create! email: "test@gmail.com", password: "863991", full_name: "xyz abc", confirmed_at: "2018-10-11 11:28:26"
User.create! email: "nguyenthanhchinh96@gmail.com", password: "30061996", confirmed_at: "2018-10-11 11:28:26", full_name: "THanh Chinh", is_admin: true
Game.create name: "Generation Streets", relase_date: DateTime.new(2018, 06, 10), summary: "Generation Streets, a game based on the real-world map. Load your hometown, find your place and this casual shooter start giving you very unexpected impressions. Almost any point on Earth is available to load except the North pole and Antarctica."
Game.create name: "Assassin's creed Odyssey", relase_date: DateTime.new(2018, 10, 16), summary: "Choose your fate in Assassin's Creed® Odyssey. From outcast to living legend, embark on an odyssey to uncover the secrets of your past and change the fate of Ancient Greece."
Game.create name: "Miracle Circus", relase_date: DateTime.new(2018, 12, 01), summary: "Qi joins the miracle circus as a genius magician. The other members all welcome Qi’s coming, like Liao, Liu, Ji, Xiang,Ning. But as the night is near around, something is approaching, straightly to their heart. Who is watching? And who are the demons of night exactly? Qi starts his investigation on a common day "
Game.create name: "RHEM II SE - The cave", relase_date: DateTime.new(2018, 12, 10), summary: "RHEM II SE - The Cave Special Edition is an intricate pure-puzzle first person adventure game. The player explores a hidden city far beneath the earths surface. RHEM II SE features non-linear gameplay non-violent story and mind-bending puzzles."
Game.create name: "Twilight Path", relase_date: DateTime.new(2017, 05, 06), summary: "A virtual reality fantasy adventure set in surreal realm between the real world and the afterlife. Meet mischievous spirits and gods. Solve puzzles. Restore ancient stone structures. Explore a gorgeous and vibrant world."
Game.create name: "Giraffe Town", relase_date: DateTime.new(2017, 11, 9), summary: "A giraffe born with slippery feet sets out to find love..."
Review.create! content: "It's good!", user_id: 1, game_id: 1, rating: 4, id: 1
Review.create! content: "It's not interesting", user_id: 1, game_id: 1, rating: 3
Review.create! content: "Awesome!!!", user_id: 1, game_id: 2, rating: 5
Review.create! content: "Animation is amazing!", user_id: 2, game_id: 5, rating: 4
Review.create! content: "So old design!", user_id: 2, game_id: 6, rating: 2
Comment.create! user_id: 1, review_id: 1, content: "ashduiashida"
Comment.create! user_id: 2, review_id: 1, content: "ashduiashduahsd"
Comment.create! user_id: 2, review_id: 1, content: "ashduiashduahsdasuihduiashdu"
Like.create! likeable_id: 1, likeable_type: "Comment", user_id: 1
Like.create! likeable_id: 1, likeable_type: "Review", user_id: 1
Like.create! likeable_id: 1, likeable_type: "Comment", user_id: 2
Platform.create name: "Windows", version: 8.1
Platform.create name: "iOS", version: 11.4
Platform.create name: "PS4", version: 3.0
Platform.create name: "XBox One", version: 5.1
GamePlatform.create game_id: 1, platform_id: 1
GamePlatform.create game_id: 2, platform_id: 2
GamePlatform.create game_id: 3, platform_id: 3
GamePlatform.create game_id: 4, platform_id: 4
GamePlatform.create game_id: 5, platform_id: 2
GamePlatform.create game_id: 6, platform_id: 3
Photo.create game_id: 1, image: "generation_streets_1"
Photo.create game_id: 1, image: "generation_streets_2"
Photo.create game_id: 2, image: "assassin_creed_odyssey_1"
Photo.create game_id: 2, image: "assassin_creed_odyssey_2"
Photo.create game_id: 3, image: "miracle_circus_1"
Photo.create game_id: 4, image: "rhem_ii_se_the_cave"
Photo.create game_id: 5, image: "twilight_path_1"
Photo.create game_id: 6, image: "giraffe_town_1"

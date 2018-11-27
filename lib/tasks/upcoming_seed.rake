Game.create name: "Miracle Circus", relase_date: DateTime.new(2018, 12, 01), summary: "Qi joins the miracle circus as a genius magician. The other members all welcome Qi’s coming, like Liao, Liu, Ji, Xiang,Ning. But as the night is near around, something is approaching, straightly to their heart. Who is watching? And who are the demons of night exactly? Qi starts his investigation on a common day "
photo = Game.last.photos.build
photo.save(validate: false)
photo.image.store!(File.open(File.join(Rails.root+"app/assets/images", 'miracle_circus_1.jpg')))
photo.save
Game.create name: "RHEM II SE - The cave", relase_date: DateTime.new(2018, 12, 10), summary: "RHEM II SE - The Cave Special Edition is an intricate pure-puzzle first person adventure game. The player explores a hidden city far beneath the earths surface. RHEM II SE features non-linear gameplay non-violent story and mind-bending puzzles."
photo = Game.last.photos.build
photo.save(validate: false)
photo.image.store!(File.open(File.join(Rails.root+"app/assets/images", 'rhem_ii_se_the_cave.jpg')))
photo.save
Game.create name: "Twilight Path", relase_date: DateTime.new(2018, 12, 06), summary: "A virtual reality fantasy adventure set in surreal realm between the real world and the afterlife. Meet mischievous spirits and gods. Solve puzzles. Restore ancient stone structures. Explore a gorgeous and vibrant world."
photo = Game.last.photos.build
photo.save(validate: false)
photo.image.store!(File.open(File.join(Rails.root+"app/assets/images", 'twilight_path_1.jpg')))
photo.save
Game.create name: "Giraffe Town", relase_date: DateTime.new(2018, 12, 9), summary: "A giraffe born with slippery feet sets out to find love....Take control of a giraffe who has had enough of being held back in life by his weird feet as you slide your way through the town in a courageous pursuit of love."

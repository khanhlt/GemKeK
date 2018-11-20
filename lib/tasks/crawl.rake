require 'igdb_client'
require 'faker'

namespace :crawl do
  desc "Crawl data"
  task game: :environment do
    client = IGDB::Client.new "7d1ef02923e10c6db545d816380cfad5"
    crawl_number = 200
    count = 1
    while count < crawl_number
      result = client.games count, {fields: "name,summary,cover"}
      name = result.first.name
      summary = result.first.summary || Faker::Lorem.paragraph
      release_date = Time.at(rand * Time.now.to_i)
      value = {name: name, summary: summary, relase_date: release_date}
      game = Game.create(value)
      2.times do
        genre_game = game.genre_game.build(genre_id: rand(1..14))
        genre_game.save
        platform_game = game.platform_game.build(platform_id: rand(1..10))
        platform_game.save
      end
      if result.first.cover.present?
        cover = "https:" + result.first.cover.url
        photo = game.photos.create(game_id: game.id, remote_image_url: cover)
        photo.save
      end
      count += 1
    end
    puts 'Done.'
  end
end

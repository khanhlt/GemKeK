require 'igdb_client'
require 'faker'
require 'progress_bar'

namespace :seed do
  desc "seed review"
  task review: :environment do
    bar = ProgressBar.new
    client = IGDB::Client.new "ccf51aac8309875ed3e52a94ef66a8ab"
    count = 1500
    Game.all.each do |f|
      3.times do
        result = client.reviews count, {fields: "title,content"}
        while result.blank?
          count += 1
          result = client.reviews count, {fields: "title,content"}
        end
        rating = rand(1..5)
        title = result.first.title || Faker::Lorem.sentence
        content = result.first.content || Faker::Lorem.paragraphs
        user_id = rand(1..20)
        value = {content: content, title: title, rating: rating, user_id: user_id, game_id: f.id}
        review = Review.create(value)
        count += 1
      end
      sleep 0.1
      bar.increment!
    end
    puts 'Done.'
  end

  desc "seed comment"
  task comment: :environment do
    bar = ProgressBar.new
    client = IGDB::Client.new "ccf51aac8309875ed3e52a94ef66a8ab"
    count = 1500
    Review.all.each do |f|
      2.times do
        result = client.reviews count, {fields: "title,content"}
        while result.blank?
          count += 1
          result = client.reviews count, {fields: "title,content"}
        end
        content = result.first.content || Faker::Lorem.paragraphs
        user_id = rand(1..20)
        value = {content: content, user_id: user_id, review_id: f.id}
        comment = Comment.create(value)
        count += 1
      end
      sleep 0.1
      bar.increment!
    end
    puts 'Done.'
  end
end

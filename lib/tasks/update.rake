namespace :update do
  desc "update review title"
  task review: :environment do
    reviews = Review.where(title: "c")
    reviews.all.each do |f|
      content = f.content.split('.')
      f.title = content[0]
      f.save
    end
    puts 'Done.'
  end
end

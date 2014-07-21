# User.destroy_all

num_users = 30
num_users.times do |i|
  User.create!(email: Faker::Internet.email)
end

num_articles = 10
num_articles.times do |i|
  # Article will have between 1 and 10 paragraphs
  article_text = Faker::Lorem.paragraphs((i%10)+1).join(' ')
  article = Article.create!(title: Faker::Lorem.word, body: article_text )

  puts "Created Article #{i}"

  # Article will have btw 1 to 7 comments.
  rand(1..7).times do |i|
    # Grab a random user that will be the commenter.
    the_user = User.find(rand(1..num_users))
    article.comments.create!(body: Faker::Lorem.paragraphs(i+1).join(' '), user: the_user)
    puts "Created comment for #{article.title} "
  end
end

# Add a bunch of comments to the last Article
last_article = Article.last
50.times do |i|
    the_user = User.find(rand(1..num_users))
    last_article.comments.create!(body: Faker::Lorem.paragraphs(i+1).join(' '), user: the_user)
end

artist_names = []
5.times do
  artist_names << Faker::Name.name
end

# Create songs
songs = []
20.times do |i|
  song = Song.create!(title: "title #{i}", artist: artist_names.sample, duration: (1..300).to_a.sample, price: 1.99)
  puts "creating song #{song.inspect}"
  songs << song
end

users = User.all

# 
genres = %w{ jazz blues rock rap}

10.times do |i|
  playlist = Playlist.create!(user: users.sample, name: "playlist #{i}", genre: genres.sample)
  (1..5).to_a.sample.times do |j|
    song = songs.sample
    playlist.songs << song
    playlist.save!
    puts "Added song #{song.title} to playlist #{playlist.name}"
  end
end

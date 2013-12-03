namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_comments
  end
end

def make_users
    30.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)

    end
  end

def make_microposts
  users = User.all(limit: 6)
  10.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_comments
  microposts = Micropost.all(limit: 6)
  5.times do
    content = Faker::Lorem.sentence(5)
    microposts.each { |micropost| micropost.comments.create!(content: content) }
  end
end

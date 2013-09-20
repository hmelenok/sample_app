namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Nikita Khmel",
                 email: "hmelenok@gmail.com",
                 password: "hmelenok91",
                 password_confirmation: "hmelenok91")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
  end
end
PASSWORD = "123456"

(1..20).each do |i|
  name = "nguyen #{i}"
  email = "nguyen#{i}@gmail.com"
    User.create!(name: name,
               email: email,
               password: PASSWORD,
               password_confirmation: PASSWORD)
  end
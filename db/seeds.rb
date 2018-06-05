User.create!(username:  "Sean",
             email: "sean.n.cordes@gmail.com",
             password:              "password",
             password_confirmation: "password")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "password"
  User.create!(username:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

# Posts
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Friends.quote
  image = File.open(File.join(Rails.root,'public/uploads/post/image/11/backsplash.jpg'))
  users.each { |user| user.posts.create!(content: content,
                                         image: image) }
end

# Likes and comments
users = User.order(:created_at).take(15)
posts = Post.order(:created_at).take(20)
content = Faker::Seinfeld.quote
posts.each do |post|
  users.each do |user|
    user.like(post)
    user.comments.create!(content: content,
                          post_id: post.id)
  end
end


# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
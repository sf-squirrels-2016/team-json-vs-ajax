require 'faker'

User.delete_all

#create 10 dummy users
users = 10.times.map do
  User.create!( :first_name => Faker::Name.first_name,
                :last_name  => Faker::Name.last_name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end

Post.delete_all
#10 random questions
posts= 10.times.map do
  Post.create!(:user_id => 1+ Random.rand(10),
               :kind =>     "question",
               :title =>  Faker::Lorem.sentence + "?")
end


#create

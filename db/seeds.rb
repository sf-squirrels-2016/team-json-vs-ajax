require 'faker'

User.delete_all

#create 10 dummy users
users = 10.times.map do
  User.create!( :first_name => Faker::Name.first_name,
                :last_name  => Faker::Name.last_name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end

Question.delete_all
#30 random questions
questions= 30.times.map do
  Question.create!(
  	user: (User.all).sample,
               title:  Faker::Hipster.sentence + "?",
               body: Faker::Lorem.paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 3)
               )
end

#100 random answers
Answer.delete_all
100.times do |n|
	Answer.create(
		user: (User.all).sample,
		question: (Question.all).sample,
		body: Faker::Lorem.paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 3)
		)
end

Comment.delete_all
#50 random comments on questions
50.times do |n|
	Comment.create(
		user:(User.all).sample,
		commentable: (Question.all).sample,
		body: Faker::Lorem.paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 3)
		)
end
#50 random comments on questions
100.times do |n|
	Comment.create(
		user:(User.all).sample,
		commentable: (Answer.all).sample,
		body: Faker::Lorem.paragraph(sentence_count = 3, supplemental = false, random_sentences_to_add = 3)
		)
end





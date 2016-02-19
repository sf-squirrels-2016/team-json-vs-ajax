get '/questions/:id/votes/add' do
  question_id = Question.find(params[:id])
  p params[:id]
  p question_id
  user = User.find(session[:user_id])
  p session[:user_id]
  my_vote = Vote.new(user: user, votable: question_id, vote_value:1)
  my_vote.save
  redirect "/questions/#{params[:id]}"
end

get '/questions/:id/votes/minus' do
  question_id = Question.find(params[:id])
  user = User.find(session[:user_id])
  my_vote = Vote.new(user: user, votable: question_id, vote_value:-1)
  my_vote.save
  redirect "/questions/#{params[:id]}"
end

get '/answers/:id/votes/add' do
  answer_id = Answer.find(params[:id])
  p '/////////////////////////params answer///////////////////'
  p params[:id]
  p answer_id
  user = User.find(session[:user_id])
  p '/////////////////////////////////// session id'
  p session[:user_id]
  my_vote = Vote.new(user: user, votable: answer_id, vote_value:1)
  my_vote.save
  redirect "/"
end

# get '/answers/:id/votes/minus' do
#   answer_id = Answer.find(params[:id])
#   user = User.find(session[:user_id])
#   my_vote = Vote.new(user: user, votable: answer_id, vote_value:-1)
#   my_vote.save
#   redirect "/questions/#{params[:id]}"
# end

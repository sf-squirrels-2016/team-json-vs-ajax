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

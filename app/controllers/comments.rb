post '/comments' do
  puts "comments for question"
  question = Question.find(params[:question_id])
  # comment = Question.create(title: params[:title], body: params[:body], user_id: session[:user_id])
  @comment = Comment.new
  @comment.body = params[:body]
  @comment.user_id = session[:user_id]
  question.comments << @comment
  if request.xhr?
    content_type :json
    {comment: params[:body], parent:params[:question_id]}.to_json
    
  else
    redirect "/questions/#{question.id}"
  end
end

post '/answer_comments' do
  answer = Answer.find(params[:answer_id])
  # comment = Question.create(title: params[:title], body: params[:body], user_id: session[:user_id])
  @comment = Comment.new
  @comment.body = params[:body]
  @comment.user_id = session[:user_id]
  answer.comments << @comment
  if request.xhr?
    content_type :json
    {comment: params[:body],  parent:params[:answer_id]}.to_json
    
  else
    redirect "/questions/#{question.id}"
  end
end

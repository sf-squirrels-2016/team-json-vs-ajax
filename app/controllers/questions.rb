get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

post '/questions' do
  question = Question.create(title: params[:title], body: params[:body], user_id: session[:user_id])
  if request.xhr?

  else
    redirect "/questions"
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  erb :'/questions/show'
end

get '/questions/:id/edit' do
  if logged_in?
  @question = Question.find_by(id: params[:id])
  if request.xhr?
    erb :'_form', :layout => false
  else
  erb :'_form'
  end
  else
    redirect "/questions/#{params[:id]}"
  end
end

put '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  if request.xhr?
    erb :'_question', :layout => false
  else
    @question.update(title: params[:title])
    redirect "/questions/#{question.id}"
  end
end

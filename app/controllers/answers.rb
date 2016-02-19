post '/questions/:id/answers' do 
	answer = Answer.create(body: params[:body], user_id: session[:user_id], question: Question.find(params[:id]))
	if answer.save 
		if request.xhr?
			erb :"_answer_row", :layout=> false, locals: { answer: answer }
		else
			redirect "/questions/#{params[:id]}"
		end
	else
		# show errors here. 
	end

end

get '/questions/:id/answers/new' do
  @question = Question.find(params[:id])
 erb :'/answers/_form', :layout => false, locals:{question_id:@question.id}
end

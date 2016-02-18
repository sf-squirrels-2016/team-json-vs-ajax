post '/questions/:question_id/answers' do 
	answer = Answer.create(body: params[:body], user: current_user, question: Question.find(params:question_id))
	if answer.save 
		if request.xhr?
			erb :"_answer_row", :layout=> false, locals: { answer: answer }
		else
			redirect "/questions/#{params[question_id]}"
		end
	else
		# show errors here. 
	end

end

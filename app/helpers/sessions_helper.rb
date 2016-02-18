def user_id
  session[:id]
end

def current_user
  User.find_by(id: user_id)
end

def logged_in?
  session.has_key?(:id)
end

def log_out
  session.delete(:id)
end

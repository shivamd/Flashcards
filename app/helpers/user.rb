helpers do
  
  def current_user
    @current_user ||= User.find_by_token(session[:token]) if session[:token]
  end

  def logged_in?
    !current_user.nil?
  end

  def login(user)
    token = SecureRandom.hex(10)
    session[:token] = token 
    user.token = token 
    user.save
    current_user
  end

end

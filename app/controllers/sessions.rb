get '/sessions' do 
	erb :"users/login"
end

post '/sessions' do 
	if User.authenticate(params[:email], params[:password])
		token = SecureRandom.hex(10)
		session[:token] = token
		user = User.find_by_email(params[:email])
		user.token = token
		user.save 
		current_user
		"Hello"
	else
		@error = "Invalid Email/Password combination."
		erb :"users/login"
	end
end

delete '/sessions' do 
	session[:token] = nil 
	redirect ('/')
end


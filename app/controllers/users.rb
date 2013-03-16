get '/users/new' do
  @user = User.new
  erb :"users/new"
end

post '/users/new' do 
  redirect ('/') unless params[:confirm_password] == params[:password]
  @user = User.new(name: params[:name], 
  								 email: params[:email], 
  								 password: params[:password])
  unless @user.save 
  	puts @user.errors.any?
  	puts @user.errors.full_messages
  	erb :"users/new"
  else
    current_user
  	redirect '/users'
  end
end

get '/users' do
  
  #  redirect '/'
  #end
  # @user = session[:current_user]
  @decks = Deck.all
  erb :user
end


get '/users/login' do 
  erb :"users/login"
end

post '/users/login' do 
  if User.authenticate(params[:email], params[:password])
    token = SecureRandom.hex(10)
    session[:token] = token
    user = User.find_by_email(params[:email])
    user.token = token
    user.save 
    current_user
    redirect ('/users')
  else
    @error = "Invalid Email/Password combination."
    erb :"users/login"
  end
end

delete '/users/logout' do 
  session[:token] = nil 
  redirect ('/')
end



get '/' do
  current_user ? redirect('/users') : (erb :index)
end


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
  	erb :"users/new"
  else
    login(@user)
    redirect('/rounds/new')
  end
end

get '/users' do
  
  erb :user
end


get '/users/login' do 
  if current_user
    redirect ('/rounds/new')
  end
  erb :"users/login"
end

post '/users/login' do 
  if User.authenticate(params[:email], params[:password])
    user = User.find_by_email(params[:email])
    login(user)
    redirect ('/rounds/new')
  else
    @error = "Invalid Email/Password combination."
    erb :"users/login"
  end
end

delete '/users/logout' do 
  session[:token] = nil 
  redirect ('/')
end



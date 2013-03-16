get '/users/new' do
  @user = User.new
  erb :"users/new"
end

post '/users/new' do 
  @password_confirmation = params[:confirm_password]
  @user = User.new(name: params[:name], 
  								 email: params[:email], 
  								 password: params[:password])
  unless @user.save 
  	puts @user.errors.any?
  	puts @user.errors.full_messages
  	erb :"users/new"
  else
  	"hello"
  end
end
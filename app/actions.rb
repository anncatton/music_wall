# make these restful

get '/' do
  @songs = Song.all
  if session[:id]
    @user = session[:id]
  end
  erb :index
end

get '/new_song' do
  @song = Song.new
  erb :'/new_song'
end

post '/new_song' do
  @song = Song.new(
    author: params[:author],
    title: params[:title],
    url: params[:url]
    )
  if @song.save
    redirect '/'
  else
    erb :'/new_song'
  end
end

get '/show_song/:id' do
  @song = Song.find(params[:id])
  erb :'/show_song'
end

get '/login' do
  @user = User.new
  erb :'/login'
end

get '/new_login' do
  @user = User.new
  erb :'/new_login'
end

# this is making a new user
post '/new_login' do
  @user = User.new(
    name: params[:name],
    email: params[:email],
    password: params[:password]
    )
  if @user.save
    session[:id] = @user.id
    redirect '/'
  else
    erb :'/new_login'
  end
end

post '/login' do
  if @user = User.find_by(email: params[:email])
    logged_in = # @user.authenticate(params[:password])
    # if @user.password == params[:password]
    if logged_in
      session[:id] = @user.id
      redirect '/'
    end
  else
    @error = "Invalid username or password!"
    erb :'/login'
  end
end

post '/logout' do
  session.clear
  redirect '/'
end

post '/upvote' do
  if session[:id]
    @user = User.find(session[:id])
    @song = Song.find(params[:id])
    binding.pry
  end
  redirect '/'
end


# call self inside sinatra when it's running (when you do binding.pry) and it will show you all the environment
# variables

# to do
# -- 'author' will become artist (in db and on web display)
# -- current session user will be the poster - so, the new author
# -- a user can only post once they're logged in
# -- wrong password sends user to blank /login (like, empty screen)
# -- wrong email just throws an error

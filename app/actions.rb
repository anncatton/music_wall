enable :sessions

get '/' do
  @songs = Song.all
  if session['id']
    @session_user = session['id']
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
    session['id'] = @user.id
    redirect '/'
  else
    erb :'/new_login'
  end
end

post '/login' do
  @user = User.where(email: params[:email]).where(password: params[:password]).first
  if @user
    session['id'] = @user.id
    redirect '/'
  else
    erb :'/login'
  end
end

post '/logout' do
  session.clear
  redirect '/'
end

post '/upvote' do
  redirect '/'
end


# call self inside sinatra when it's running (when you do binding.pry) and it will show you all the environment
# variables


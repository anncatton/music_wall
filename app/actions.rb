helpers do

  def current_user
    if session[:id] and @user = User.find(session[:id])
      @user
    end
  end

end

get '/' do
  @songs = Song.all
  current_user
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
  if session[:id]
    @song.save
    redirect '/'
  else
    erb :'/new_song'
  end
end

get '/show_song/:id' do
  @song = Song.find(params[:id])
  erb :'/show_song'
end

# get rid of this and just pop the login action on the home page
get '/login' do
  # this just allows a new user to exist as @user, which can then be created with the data the user enters
  unless current_user
    @new_user = User.new
  end
  erb :'/login'
end

post '/login' do
if @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
  # you could search with email, then return 'no user' if it doesn't match
  # and then check whether password matches that user
  # @user = User.where(email: params[:email]).where(password: params[:password])
  # when you hit the submit button is when post gets activated.
    current_user
    redirect '/'
  else
    erb :'/login'
  end
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

post '/logout' do
  # what is session.delete :some_param ?
  session.clear
  redirect '/'
end

post '/upvote' do
  if session[:id]
    @song = Song.find(params[:id])
    @song.upvotes += 1
    @song.save
  end
  redirect '/'
end


# ActiveRecord secure passwords

# call self inside sinatra when it's running (when you do binding.pry) and it will show you all the environment
# variables

# to do
# -- 'author' will become artist (in db and on web display)
# -- current session user will be the poster - so, the new author
# -- a user can only post once they're logged in. does this but doesn't display why they can't post
# -- display upvote score
# -- display error on wrong login
# -- display current score on song list
# -- don't redirect to index on upvote, just update score - is that a page reload?

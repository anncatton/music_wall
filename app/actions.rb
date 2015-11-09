get '/' do
  @songs = Song.all
  erb :index
end

get '/new_song' do
  @song = Song.new
  erb :'/new_song'
end

# get '/messages/new' do
#   @message = Message.new
#   erb :'messages/new'
# end

post '/new_song' do
  @song = Song.new(
    author: params[:author],
    title: params[:title],
    url: params[:url]
    )

  @song.save
  # if @song.save
  #   redirect '/'
  # else
  #   erb :'/new_song'
  # end
end


get '/' do
  @songs = Song.all
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



  # def change
  #   add_reference :students, :teacher, index: true

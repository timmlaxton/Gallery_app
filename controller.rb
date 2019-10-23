require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('models/exhibtion')
require_relative('models/artist')
also_reload('./models/*')

get '/visitors' do
  @exhibtions = Exhibition.all
  @artists = Artist.all
  erb(:visitor_view)
end

get '/exhibtions/filter/catergory' do
  @exhibtions = Exhibition.filter_by_catergory(params['catergory'])
  erb(:filtered_view)
end

get '/exhibtions/filter/artist' do
  @exhibtions = Exhibtion.filter_by_artist(params['alias'])
  erb(:filtered_view)
end

get '/management/exhibtions' do
  @exhibitions = Exhibition.all
  erb(:manager_view)
end

get '/management/exhibitions/new' do
  @artists = Artist.all
  @exhibition = Exhibition.new(params)
  erb(:new_exhibition)
end

get '/management/artist' do
  @artists = Artist.all
  erb(:artists)
end

geet '/management/artists/new' do
  erb(:new_artsit)
end

get '/management/artists/:id' do
  @artist = Artist.find(params['id'])
  erb(:show_artist)
end

get '/visitors/:id' do
  @exhibition = Exhibition.find(params['id'])
  erb(:show_exhibition_visitors)
end

get '/exhibitions/:id/edit' do
  @artisits = Artist.all
  @exhibition = Exhibition.find(params['id'])
  erb(:edit_exhibition)
end

get '/artists/:id/edit' do
  @exhibitions = Exhibition.all
  @artist = Artist.find(params['id'])
  erb(:edit_artist)
end

post '/artists/new' do
  Artist.new(params).save
  redirect to '/management/exhibitions'
end

post '/artists/:id' do
  Exhibition.new(params).update
  redirect to '/management/exhibitons'
end

post '/artists/:id/delete' do
  Artist.new(params).delete
  redirect to '/management/artists'
end

post '/exhibitions/:id/delete' do
  Exhibitons.new(params).delete
  redirect to '/manangement/exhibitions'
end

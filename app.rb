require 'sinatra'
require 'faye'

use Faye::RackAdapter, :mount => '/faye', :timeout => 25

get '/' do
  erb :index
end

get '/:app_name' do
  erb :show
end

get '/:app_name/deploy' do
  client = Faye::Client.new("http://localhost/faye")
  client.publish("/#{params[:app_name]}", params[:message])
end

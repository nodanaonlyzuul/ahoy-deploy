require 'sinatra'
require 'faye'

use Faye::RackAdapter, :mount => '/faye', :timeout => 25
Faye::WebSocket.load_adapter('thin')

get '/' do
  erb :index
end

get '/:app_name' do
  erb :index
end

get '/:app_name/deploy' do
  client = Faye::Client.new("http://localhost:9292/faye")
  client.publish("/#{params[:app_name]}", params[:message])
end

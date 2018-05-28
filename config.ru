if defined?(PhusionPassenger)
  PhusionPassenger.advertised_concurrency_level = 0
end

require './app'
run Sinatra::Application

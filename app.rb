require 'sinatra/base'
require 'haml'

class LoginSample < Sinatra::Base
	enable :sessions	

	# filter
	before do
		pass if request.path_info == '/login'
		unless session[:user]
			redirect '/login'
		end
	end

	get '/' do
		'welcome ' + session[:user]
	end

	get '/login' do
		haml :login
	end

	post '/login' do
		if params[:username] == 'tom' and params[:password] == 'cat'
			session[:user] = 'tom'
			redirect '/'	
		else
			haml :login
		end #if
	end
	
	run! if app_file == $0
end


require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, 'protein'
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    def logged_in?
      !!session[:user_id]
    end 

    def current_user 
      User.find_by_id(session[:user_id])
    end 

    def redirect_root
      while !logged_in? 
        redirect to '/login'
      end 
    end 

  end 

end

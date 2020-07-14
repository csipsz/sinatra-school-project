class SessionsController < ApplicationController
    use Rack::Flash

    get '/signup' do 
        erb :'sessions/signup'
    end 

    post '/signup' do 
        @user = User.new(username: params[:user][:username], password: params[:user][:password])
        if @user.save
            session[:user_id] = @user.id
            redirect to  '/events'
        else 
            flash.now[:error] = @user.errors.full_messages
            erb :'sessions/signup' 
        end 
    end 

    get '/login' do 
        erb :'sessions/login'
    end 

    post '/login' do 
        @user = User.find_by(username: params[:user][:username])

        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect to  '/events'
        else 
            flash.now[:error] = ["Invalid username or password"]
            erb :'sessions/login'
        end 
    end 

    get '/logout' do 
        session.clear
        redirect to '/'
    end 


end 
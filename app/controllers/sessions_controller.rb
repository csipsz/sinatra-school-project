require 'pry'
class SessionsController < ApplicationController
    get '/signup' do 
        erb :'sessions/signup'
    end 

    post '/signup' do 
        @user = User.new(username: params[:user][:username], password: params[:user][:password])
        if @user.save
            #erb :'sessions/login'
            session[:user_id] = @user.id
            redirect to  '/events'
        else 
            erb :'sessions/error' 
        end 
    end 

    get '/login' do 
        erb :'sessions/login'
    end 

    get '/error' do 
        erb :'sessions/error'
    end 

    post '/login' do 
        @user = User.find_by(username: params[:user][:username])

        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect to  '/events'
        else 
            redirect to '/error'
        end 
    end 

    get '/logout' do 
        session.clear
        redirect to '/'
    end 


end 
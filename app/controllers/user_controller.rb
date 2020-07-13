class UserController < ApplicationController

    get '/users' do 
        @users = User.all
        erb :'users/index'
    end 


    get '/users/:id' do 
        @events = Event.all
        @user = User.find(params[:id])
        erb :'/users/mentions'
    end 

end 
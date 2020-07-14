class UserController < ApplicationController

    get '/users' do
        redirect_root 
        @users = User.all
        erb :'users/index'
    end 


    get '/users/:id' do
        redirect_root
        @events = Event.all
        @user = User.find_by_id(params[:id])
        erb :'/users/mentions'
    end 

end 
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

    get '/user/delete' do
        erb :'/users/del'
    end 

    delete '/user/:id' do 
        if current_user
            Event.where(user_id: current_user.id).destroy_all
            current_user.destroy
            session.clear
        end 
        redirect to '/'
    end 
end 

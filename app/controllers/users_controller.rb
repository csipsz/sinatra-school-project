class UserController < ApplicationController

    get '/users' do 
        if logged_in?
            @users = User.all
            erb :'users/index'
        else 
            redirect to '/login'
        end 
    end 


    get '/users/:id' do 
        if logged_in?
            @events = Event.all
            @user = User.find_by_id(params[:id])
            erb :'/users/mentions'
        else 
            redirect to '/login'
        end 
    end 

end 
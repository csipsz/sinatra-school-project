class EventController < ApplicationController 

    get '/events' do 
        @events = Event.all
        erb :'events/index'
    end 

    get '/events/new' do 
        erb :'events/new'
    end 

    post '/events' do 
        "Event created"
    end 

    get '/events/:id' do 
    end 

    get '/events/:id/edit' do 
    end 

    patch '/events/id' do 
    end 

    delete 'event/:id' do 
    end 


end 
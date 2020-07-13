require 'pry'

class EventController < ApplicationController 

    get '/events' do 
        @events = Event.all
        erb :'events/index'
    end 

    get '/upcoming' do 
        @events = Event.all
        erb :'events/upcoming'
    end 

    get '/events/new' do 

        erb :'events/new'
    end 

    post '/events' do 
        @event = Event.create(params[:event])
        @event.user = current_user
        redirect to "/events/#{@event.id}"

    end 

    get '/events/:id' do 
        "Show page "
    end 

    get '/events/:id/edit' do 
    end 

    patch '/events/id' do 
    end 

    delete 'event/:id' do 
    end 

    private 
        def find_event 
            @event = Event.find_by_id(params[:id])
        end 

end 
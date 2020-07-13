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
        current_user.events << @event
        redirect to "/events/#{@event.id}"
    end 

    get '/events/:id' do 
        find_event
        if @event 
            erb :'events/show'
        else 
            redirect '/events'
        end 
    end 

    get '/events/:id/edit' do 
        @event = find_event
        erb :'events/edit'
    end 

    patch '/events/:id' do 
        find_event
        @event.update(params[:event])
        redirect "/events/#{@event.id}"
    end 

    delete '/event/:id' do 
        find_event.destroy
        redirect to '/events'
    end 

    private 
        def find_event 
            @event = Event.find_by_id(params[:id])
        end 

end 
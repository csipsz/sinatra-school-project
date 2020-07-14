require 'pry'

class EventController < ApplicationController 

    get '/events' do 
        @events = Event.all.sort_by &:date
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
        if @event.save
            current_user.events << @event
            redirect to "/events/#{@event.id}"
        else 
            erb:'events/new'
        end 
    end 

    get '/events/:id' do 
        current_event
        if @event 
            erb :'events/show'
        else 
            redirect '/events'
        end 
    end 

    get '/events/:id/edit' do 
        @event = current_event
        if @event.user == current_user
            erb :'events/edit'
        else 
            erb :'events/error'
        end 
    end 

    patch '/events/:id' do 
        current_event
        @event.update(params[:event])
        redirect "/events/#{@event.id}"
    end 

    delete '/event/:id' do 
        if current_event.user == current_user
            current_event.destroy
            redirect to '/events'
        else 
            erb :'events/error'
        end 
    end 

    private 
        def current_event 
            @event = Event.find_by_id(params[:id])
        end 

end 
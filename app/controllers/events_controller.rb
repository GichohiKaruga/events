class EventsController < ApplicationController


  get '/events' do
    @events = Event.all
    @events.to_json
  end

  post '/events' do
    @params = JSON.parse(request.body.read)
    @event = Event.new(title: @params['title'],
                       start: @params['start'], end: @params['end'], type_id: @params['type_id'])

    response = if @event.save
                 Response.new(200, 'Record saved successfully')
               else
                 Response.new(205, 'Error')
               end
    response.to_json
  end

  get '/events/:id' do
    find_event.to_json
  end

  get '/events/users/:id' do
    find_event_users.to_json
  end

  put '/events' do
    @params = JSON.parse(request.body.read)
    @event = Event.find(@params[:id])
    response = if @event.save
                 Response.new(200, 'Record saved successfully')
               else
                 Response.new(205, 'Error')
               end
    response.to_json
  end

  delete '/events/:id' do
    @event = find_event
    response = if @event.destroy
                 Response.new(200, 'Record deleted successfully')
               else
                 Response.new(205, 'Error')
               end
    response.to_json
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def find_event_users
    @user_events = UserEvent.find_by(event_id: params[:id])
  end

end

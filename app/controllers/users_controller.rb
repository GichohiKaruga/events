class UsersController < ApplicationController

  post '/login' do
    @params = JSON.parse(request.body.read)
    @user = User.find_by(email: @params['email'])
    response = if @user&.authenticate(@params['password'])
                 SerializedUser.new(@user.name, @user.phone, @user.email)
               else
                 Response.new(205, 'Error')
               end
    response.to_json
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    @user.to_json
  end

  get '/users/events/:id' do
    find_event_users.to_json
  end

  post '/users/events' do
    @params = JSON.parse(request.body.read)
    @user_event = UserEvent.new(user_id: @params['user_id'], event_id: @params['event_id'])
    response = if @user_event.save
                 @user_event
               else
                 Response.new(205, 'Error')
               end
    status 201
    response.to_json
  end

  post '/users' do
    @params = JSON.parse(request.body.read)
    @user = User.new(name: @params['name'], email: @params['email'], password: @params['password'], phone: @params['phone'])

    response = if @user.save
                 SerializedUser.new(@user.name, @user.phone, @user.email)
               else
                 Response.new(205, 'Error')
               end
    response.to_json
  end

  private

  def find_user_events
    @user_events = UserEvent.find_by(user_id: params[:id])
  end


end
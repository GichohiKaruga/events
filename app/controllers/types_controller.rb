require 'json'

class TypesController < ApplicationController

  get '/types' do
    @types = Type.all
    @types.to_json
  end

  post '/types' do
    @params = JSON.parse(request.body.read)
    @type = Type.new(name: @params['name'], description: @params['description'])

    response = if @type.save
                 Response.new(200, 'Record saved successfully')
               else
                 Response.new(205, 'Error')
               end
    response.to_json
  end

  get '/types/:id' do
    find_type.to_json
  end

  put '/types' do
    @params = JSON.parse(request.body.read)
    @type = Type.find(@params[:id])
    response = if @type.save
                 Response.new(200, 'Record saved successfully')
               else
                 Response.new(205, 'Error')
               end
    response.to_json
  end

  delete '/types/:id' do
    @type = find_type
    response = if @type.destroy
                 Response.new(200, 'Record deleted successfully')
               else
                 Response.new(205, 'Error')
               end
    response.to_json
  end

  private

  def find_type
    @type = Type.find(params[:id])
  end


end

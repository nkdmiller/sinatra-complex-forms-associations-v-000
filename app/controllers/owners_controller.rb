class OwnersController < ApplicationController

  get '/owners' do
    @owners = Owner.all
    erb :'/owners/index' 
  end

  get '/owners/new' do 
    @pets = Pet.all
    erb :'/owners/new'
  end

  post '/owners' do 
    @owner = Owner.create(params[:owner])
    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
    end
    @owner.save
    redirect to "owners/#{@owner.id}"
  end

  get '/owners/:id/edit' do 
    @owner = Owner.find(params[:id])
    erb :'/owners/edit'
  end

  get '/owners/:id' do 
    @owner = Owner.find(params[:id])
    erb :'/owners/show'
  end
  use Rack::MethodOverride
  patch '/owners/:id' do 
    @owner = Owner.find(params[:id])
<<<<<<< HEAD

    @owner.update(params["owner"])
    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
    end
=======
    @owner.update(params[:owner])
      if !params["pet"]["name"].empty?
    @owner.pets << Pet.create(name: params["pet"]["name"])
      end
>>>>>>> b89e4163fff2f3934c0a8abc097469814cbb1b5a
    redirect to "owners/#{@owner.id}"
  end
end
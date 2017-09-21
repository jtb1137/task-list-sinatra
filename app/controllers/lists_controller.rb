class ListsController < ApplicationController
	get '/lists' do
		@lists = List.all
		erb :'/lists/index'
	end

	get '/lists/new' do
		erb :'/lists/new'
	end

	get '/lists/:id/edit' do
		@list = List.find_by(id: params[:id])
		erb :'/lists/edit'
	end
	
	get '/lists/:id' do
		@list = List.find_by(id: params[:id])
		erb :'/lists/show'
	end

	post '/lists' do
		@list = List.create(name: params[:name])
		@list.save
		redirect '/lists' #make show page?
	end

	patch '/lists/:id' do
		@list = List.find_by(id: params[:id])
		@list.name = params[:name]
		@list.save
		redirect "/lists"
	end

	delete '/lists/:id' do
		@list = List.find_by(id: params[:id])
		@list.destroy
		redirect '/lists'
	end
end

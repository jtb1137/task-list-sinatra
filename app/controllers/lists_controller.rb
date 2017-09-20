class ListsController < ApplicationController
	get '/lists' do
		@lists = List.all
		erb :'/lists/index'
	end

	get '/lists/new' do
		erb :'/lists/new'
	end

	post '/lists' do
		@list = List.create(name: params[:name])
		@list.save
		redirect '/lists' #make show page?
	end
end

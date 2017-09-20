class TasksController < ApplicationController
	get '/tasks' do
		@tasks = Task.all
		erb :'/tasks/index'
	end

	get '/tasks/new' do
		erb :'/tasks/new'
	end

	post '/tasks' do
		@task = Task.create(name: params[:name], list_id: params[:list_id])
		@task.save
		redirect '/tasks' #make show page?
	end

end
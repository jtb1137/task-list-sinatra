class TasksController < ApplicationController
	get '/tasks' do
		@tasks = Task.all
		erb :'/tasks/index'
	end

	get '/tasks/new' do
		erb :'/tasks/new'
	end

	get '/tasks/:id/edit' do
		@task = Task.find_by(id: params[:id])
		erb :'/tasks/edit'
	end
	
	get '/tasks/:id' do
		@task = Task.find_by(id: params[:id])
		erb :'/tasks/show'
	end

	post '/tasks' do
		@task = Task.create(name: params[:name], list_id: params[:list_id])
		@task.save
		redirect '/tasks' #make show page?
	end

	delete '/tasks/:id' do
		@task = Task.find_by(id: params[:id])
		@task.delete
		redirect '/tasks'
	end

end
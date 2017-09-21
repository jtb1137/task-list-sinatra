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

	get '/tasks/:id/delete' do
		@task = Task.find_by(id: params[:id])
		erb :'/tasks/delete'
	end
	
	get '/tasks/:id' do
		@task = Task.find_by(id: params[:id])
		erb :'/tasks/show'
	end

	post '/tasks' do
		@task = Task.create(name: params[:name], list_id: params[:list_id])
		@task.save
		redirect '/lists'
	end

	patch '/tasks/:id' do
		@task = Task.find_by(id: params[:id])
		@task.name = params[:name]
		@task.save
		redirect "/lists"
	end

	delete '/tasks/:id' do
		@task = Task.find_by(id: params[:id])
		@task.destroy
		redirect '/lists'
	end

end
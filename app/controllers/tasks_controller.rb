class TasksController < ApplicationController
	before_action :set_value, only: [:create_task, :index, :edit, :update, :destroy, :toggle_status]
	before_action :set_task, only: [:edit, :update, :destroy, :toggle_status]

	def index
		@tasks = Task.all
		@task = Task.new
	end

	def edit
		respond_to do |format|
			format.html {}
			format.js
		end
	end

	def create_task
		@tasks = Task.all
		@task = Task.new(task_params)
		@task.project_id = @project.id
		@task.save!
		respond_to do |format|
			format.html { redirect_to get_tasks_path } 
			format.js
		end
	end

	def update
		if @task.errors.blank?
			@task.update(task_params)
			flash[:success] = "Task Updated."
			redirect_to get_tasks_path(id: @task.project.id)
		end
	end

	def destroy
		@task.destroy
		redirect_to get_tasks_path(id: @task.project.id)
	end

	def toggle_status
		if @task.pending?
	      @task.done!
	    elsif @task.done?
	      @task.pending!
	    end
	  redirect_to get_tasks_path(id: @task.project.id), notice: 'Task status was succedfully updated.'
	end

	private

	def task_params
		params.require(:task).permit(:name, :deadline, :status, :priority)
	end

	def set_value
		@project = Project.where(id: params[:id]).first
	end

	def set_task
		@task = Task.find(params[:id])
	end
end

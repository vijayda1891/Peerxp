class CommentsController < ApplicationController
	before_action :set_task, only: [:new, :create, :destroy]

	def new
		@comment = Comment.new
		respond_to do |format|
			format.html {}
			format.js
		end
	end

	def create
		@comment = Comment.new(comment_params)
		@comment.file_attachment = params[:file_attachment]
		@comment.task_id = @task.id
		@comment.save!
		redirect_to get_tasks_path(id: @task.project.id)
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to get_tasks_path(id: @task.project.id)
	end

	private

	def comment_params
		params.require(:comment).permit(:comment, :file_attachment)
	end

	def set_task
		@task = Task.where(id: params[:id]).first
	end
end

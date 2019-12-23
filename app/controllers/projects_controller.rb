class ProjectsController < ApplicationController

	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
		respond_to do |format|
			format.html
			format.js { render :add_project }
		end
	end

	def edit
		@project = Project.find(params[:id])
		respond_to do |format|
			format.html
			format.js { render :edit_project }
		end
	end

	def create
		@project = Project.new(project_params)
		if @project.errors.blank?
			@project.user_id = current_user.id
			@project.save!
			flash[:success] = "Project Created."
			redirect_to root_path
		end
	end
	
	def update
		@project = Project.find(params[:id])
		if @project.errors.blank?
			@project.update(project_params)
			flash[:success] = "Project Updated."
			redirect_to root_path
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to root_path
	end

	private

	def project_params
		params.require(:project).permit(:name)
	end

end

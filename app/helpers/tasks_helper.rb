module TasksHelper
	def task_status_color task
		if task.pending?
			'color: red;'
		else
			'color: green;'
		end
	end
end

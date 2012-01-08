module ProjectsHelper
	def sorted_task_ledgers(label,project, sort_key)
		link_to label, present_task_ledgers_project_path(project) + "?sort=#{sort_key}", :remote=>true
	end
end

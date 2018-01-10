# crumb :root do
#   link "Inicio", root_path
# end

# crumb :employees do
#   link " Empleados"
# end

# crumb :employee do |employee|
#   link employee.last_name, employee
#   parent :employees
# end

# crumb :clinical do |clinical|
#   link "Datos Clinicos"
#   # parent :employee, clinical.employee
# end

# crumb :family_group do |family_group|
#   link "Grupo Familiar"
#   parent family_group.employee
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
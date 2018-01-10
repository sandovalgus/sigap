module DynamicSelectable
  class DepartmentFunctionsController < SelectController
    def index
      functions = Function.where(department_id: params[:department_id]).select('id, name').order('name asc')
      render json: functions
    end
  end
end

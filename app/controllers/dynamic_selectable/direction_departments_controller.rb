module DynamicSelectable
  class DirectionDepartmentsController < SelectController
    def index
      departments = Department.where(direction_id: params[:direction_id]).select('id, name').order('name asc')
      render json: departments
    end
  end
end

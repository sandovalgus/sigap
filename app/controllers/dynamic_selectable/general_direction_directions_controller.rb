module DynamicSelectable
  class GeneralDirectionDirectionsController < SelectController
    def index
      directions = Direction.where(general_direction_id: params[:general_direction_id]).select('id, name').order('name asc')
      render json: directions
    end
  end
end
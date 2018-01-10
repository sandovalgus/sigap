# class SearchController < ApplicationController
#   def create
#   	palabra = "%#{params[:keyword]}%" 
#   	@employees= Employee.where("document_number LIKE ? OR name LIKE ?", palabra, palabra) 
#   	# raise @employees.to_yaml
#   	respond_to do |format|
#   		format.html {redirect_to root_path}
#   		format.json {render json: @employees}
#   		format.js
#   	end
#   end
# end

class WorkersController < ApplicationController
 def show
  @worker = Worker.find_by(id: params[:id])
  render 'show.json.jbuilder'
 end
end

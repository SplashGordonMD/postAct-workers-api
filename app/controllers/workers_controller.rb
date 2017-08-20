class WorkersController < ApplicationController

 def index
  @workers = Worker.all
  render 'index.json.jbuilder'
 end
   
 def show
  @worker = Worker.find_by(id: params[:id])
  render 'show.json.jbuilder'
 end
end

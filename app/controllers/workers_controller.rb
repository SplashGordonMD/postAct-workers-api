class WorkersController < ApplicationController
 def index
  @workers = Worker.all
  render 'index.json.jbuilder'
 end

 def create
  @worker = Worker.new(
    first_name: params[:first_name],
    last_name: params[:last_name],
    birthdate: params[:birthdate],
    email: params[:email],
    ssn: params[:ssn]
  )
  @employee.save
 end 


 def show
  @worker = Worker.find_by(id: params[:id])
  render 'show.json.jbuilder'
 end

 def update
  @worker = Worker.find_by(id: params[:id])
  @worker.first_name = params[:first_name] || @worker.first_name
  @worker.last_name = params[:last_name] || @worker.last_name
  @worker.birthdate = params[:birthdate] || @worker.birthdate
  @worker.email = params[:email] || @worker.email
  @worker.ssn = params[:ssn] || @worker.ssn
  @worker.save
  render 'show.json.jbuilder'
 end

 def destroy 
  @worker = Worker.find_by(id: params[:id])
  @worker.destroy
  render 'json: {'
 end
end 
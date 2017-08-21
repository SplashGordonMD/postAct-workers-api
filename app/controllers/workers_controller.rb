class WorkersController < ApplicationController
  HEADERS = { 'Authorization' => "Token token=#{ENV['API_KEY']}", 'X-User-Email' => ENV['API_EMAIL'] }
 
 def index
  # @workers = Worker.all
  @workers = Unirest.get(
   "#{ENV['API_BASE_URL']}/workers",
   headers: HEADERS
  ).body
  render 'index.html.erb'
 end

 def new
    render 'new.html.erb'
 end   

 def create
  @worker = Unirest.post(
    "#{ENV['API_BASE_URL']}/workers",
   headers: HEADERS,
   parameters: {
     first_name: params[:first_name],
     last_name: params[:last_name],
     birthdate: params[:birthdate],
     email: params[:email],
     }
    ).body
    redirect_to "/workers/#{@worker[:id]}"
 end 


 def show
  @worker = Unirest.get(
    "#{ENV['API_BASE_URL']}/workers/#{params[:id]}",
    headers: HEADERS,
  ).body
  render 'show.html.erb'
 end

 def edit
  @worker = Unirest.get(
     "#{ENV['API_BASE_URL']}/workers/#{params[:id]}",
     headers: HEADERS,
    ).body
  render 'edit.html.erb'
 end 

 def update
  @worker = Unirest.get(
    "#{ENV['API_BASE_URL']}/workers/#{params[:id]}",
    headers: HEADERS,
    parameters: {
       first_name: params[:first_name],
       last_name: params[:last_name],
       birthdate: params[:birthdate],
       email: params[:email]
    }
  ).body  
  redirect_to "/workers/#{@worker[:id]}"  
 end

 def destroy 
  message = Unirest.delete(
     "#{ENV['API_BASE_URL']}/workers/#{params[:id]}",
     headers: HEADERS
   ).body
   redirect_to "/workers"
 end
end 
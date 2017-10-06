class RegisteredappsController < ApplicationController
  
  
  def index
    @registeredapps = Registeredapp.all
  end

  def show
    @registeredapp = Registeredapp.find(params[:id])
  end

  def new
    @registeredapp = Registeredapp.new
  end

  def edit
    @registeredapp = Registeredapp.find(params[:id])
  end
  
  
  def create
     @registeredapp = Registeredapp.new(registeredapp_params)

     if @registeredapp.save
       redirect_to @registeredapp, notice: "Application was saved successfully."
     else
       flash.now[:alert] = "Error saving application. Please try again."
       render :new
     end
  end  
  
  def update
     @registeredapp = Registeredapp.find(params[:id])
     @registeredapp.assign_attributes(registeredapp_params)
 
     if @registeredapp.save
        flash[:notice] = "Application was updated."
       redirect_to @registeredapp
     else
       flash.now[:alert] = "Error saving application. Please try again."
       render :edit
     end
  end
  
   def destroy
     @registeredapp = Registeredapp.find(params[:id])
 
     if @registeredapp.destroy
       flash[:notice] = "\"#{@registeredapp.name}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the application."
       render :show
     end
   end   
  
  private
  def registeredapp_params
    params.require(:registeredapp).permit(:name, :url)
  end
end

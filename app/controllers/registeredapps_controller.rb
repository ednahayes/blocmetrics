class RegisteredappsController < ApplicationController
  before_action :require_sign_in, except: [:show]  
   #before_action :authorize_user
  before_action :authenticate_user!
    
    
  def index
    @registeredapps = current_user.registeredapps
    
  end

  def show
    
    set_registeredapp
    #@registeredapp = Registeredapp.find(params[:id])
    @events = @registeredapp.events.group_by(&:name)
  end

  def new
    @registeredapp = Registeredapp.new
  end

  def edit
     #set_registeredapp
    @registeredapp = Registeredapp.find(params[:id])
  end
  
  
  def create
     @registeredapp = Registeredapp.new(registeredapp_params)
     @registeredapp.user = current_user
     if @registeredapp.save
       redirect_to @registeredapp, notice: "Your Application was saved successfully."
     else
       flash.now[:alert] = "Error saving your application. Please try again."
       render :new
     end
  end  
  
  def update
     #set_registeredapp 
     @registeredapp = Registeredapp.find(params[:id])
     @registeredapp.assign_attributes(registeredapp_params)
 
     if @registeredapp.save
        flash[:notice] = "Application was updated."
       redirect_to @registeredapp
     else
       flash.now[:alert] = "Error saving changes to your #{@registeredapp.name}. Please try again."
       render :edit
     end
  end
  
   def destroy
     #set_registeredapp
     @registeredapp = Registeredapp.find(params[:id])
 
     if @registeredapp.destroy
       flash[:notice] = "\"#{@registeredapp.name}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the application. Please try again"
       render :show
     end
   end   
  
  private
    def registeredapp_params
        params.require(:registeredapp).permit(:name, :url)
    end
  
    def authorize_user
        registeredapp = Registeredapp.find(registeredapp_params)
        unless current_user == registeredapp.user  || current_user.role == 'admin' 
            flash[:alert] = "You must be an admin or registered user to do that."
            redirect_to registeredapp_path
        end
    end
    
    def set_registeredapp
        @registeredapp ||= Registeredapp.find(params[:id])
    end
end

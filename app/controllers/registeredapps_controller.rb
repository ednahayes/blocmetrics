class RegisteredappsController < ApplicationController
  def index
    @registeredapps = Registeredapp.all
  end

  def show
  end

  def new
    @registeredapp = Registeredapp.new
  end

  def edit
  end
end

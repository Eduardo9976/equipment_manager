class ManufacturersController < ApplicationController
  before_action :set_manufacturer, only: %i[:show, :edit, :update, :destroy]
  #before_action :authenticate_user!
  
  def index
    @manufacturers = Manufacturer.all
  end
  def show
    @manufacturer = set_manufacturer
  end  

  def new
    @manufacturer = Manufacturer.new
  end
  
  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      flash[:notice] = 'Cadastrado com sucesso'
      redirect_to @manufacturer
    else
      render :new
    end    
  end
  
  def edit
    set_manufacturer
  end

  def update 
    set_manufacturer
    if @manufacturer.update(manufacturer_params)
      flash[:notice] = 'Salvo com sucesso'
      redirect_to @manufacturer
    else
      flash[:notice] = 'Algo deu errado, tente novamente'
      render :edit
    end    
  end
  
  def destroy
    set_manufacturer
    if @manufacturer.destroy
      flash[:notice] = 'Fabricante deletado com sucesso'
      redirect_to manufacturers_path
    else
      flash[:notice] = 'Algo deu errado, tente novamente'  
      redirect_to manufacturer_path(manufacturer)
    end  
  end  
  
  
  private

  def set_manufacturer
    @manufacturer = Manufacturer.find(params[:id])
  end  
  
  
  def manufacturer_params
    params.require(:manufacturer).permit(:name) 
  end  
  
end  